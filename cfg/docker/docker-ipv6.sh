#!/usr/bin/env bash
# Gives Docker's containers the egress an IPv6-only host has. Run as root on the
# server; safe to run again, and a second run changes nothing.
#
# Without it a container on an IPv6-only host reaches nothing: its bridge is
# IPv4-only and the host has no IPv4 route to NAT it out of. Giving the bridges
# IPv6 is not enough on its own, because the address it gets decides whether it
# is used. From a ULA (fd00::/8) address, glibc's RFC 6724 ordering ranks IPv4
# above IPv6, so every lookup tries the dead A records first and waits out each
# timeout; App Check refused every request after a minute that way. Addresses
# carved from the host's own global /64 are preferred over IPv4, and Docker
# still masquerades them behind the host's address, so no container becomes
# reachable from outside.
#
# This only extends what the host has. A destination with no AAAA record
# (github.com and ghcr.io, among others) stays unreachable from the containers,
# exactly as it is from the host.
#
# default-network-opts applies only when a network is created, so every
# user-defined bridge network still without IPv6 is recreated, by taking down
# and bringing back up the compose projects that use it. That is a short outage
# for those projects, once.
#
# The prefix is read from the interface that carries the IPv6 default route.
# Set DOCKER_IPV6_PREFIX (e.g. 2001:db8:1:2::/64) where that guess is wrong.
set -euo pipefail

daemon_json=/etc/docker/daemon.json

# Colour only on a terminal, and never alone: every line also carries a mark
# and a word, so a log file or a colour-blind reader loses nothing.
if [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
  bold=$'\e[1m' dim=$'\e[2m' red=$'\e[31m' green=$'\e[32m' yellow=$'\e[33m' blue=$'\e[34m' reset=$'\e[0m'
else
  bold='' dim='' red='' green='' yellow='' blue='' reset=''
fi

step() { printf '\n%s▸ %s%s\n' "$bold$blue" "$1" "$reset"; }
ok()   { printf '  %s✓%s %-24s %s\n' "$green" "$reset" "$1" "${2:-}"; }
work() { printf '  %s↻%s %-24s %s\n' "$yellow" "$reset" "$1" "${2:-}"; }
skip() { printf '  %s–%s %-24s %s\n' "$yellow" "$reset" "$1" "$dim${2:-}$reset"; }
info() { printf '  %s%-26s%s %s\n' "$dim" "$1" "$reset" "$2"; }
die()  { printf '\n%s✗ %s%s\n' "$bold$red" "$*" "$reset" >&2; exit 1; }

# Runs a command quietly. Compose narrates every container; that is noise
# unless something fails, and then it is the only useful thing on screen.
log="$(mktemp)"
trap 'rm -f "$log"' EXIT
quiet() {
  local what="$1"; shift
  if ! "$@" >"$log" 2>&1; then
    printf '%s' "$dim" >&2; sed 's/^/    /' "$log" >&2; printf '%s' "$reset" >&2
    die "$what failed."
  fi
}

printf '%sDocker IPv6 egress%s\n' "$bold" "$reset"

[[ $EUID -eq 0 ]] || die "Run as root."
for cmd in docker python3 ip; do
  command -v "$cmd" >/dev/null || die "$cmd is not installed."
done

# ip6tables, and with it the IPv6 masquerade this relies on, became the default
# in Engine 27.
docker_version="$(docker version --format '{{.Server.Version}}')"
(( ${docker_version%%.*} >= 27 )) || die "Docker Engine 27 or newer is needed; this is $docker_version."

prefix="${DOCKER_IPV6_PREFIX:-}" source="DOCKER_IPV6_PREFIX"
if [[ -z "$prefix" ]]; then
  dev="$(ip -6 route show default | awk '{for (i = 1; i < NF; i++) if ($i == "dev") { print $(i + 1); exit }}')"
  [[ -n "$dev" ]] || die "No IPv6 default route, so there is no egress to give Docker."
  prefix="$(ip -6 -o addr show dev "$dev" scope global \
    | awk '!/temporary/ && $4 ~ /\/64$/ { print $4; exit }')"
  [[ -n "$prefix" ]] || die "No global /64 on $dev. Set DOCKER_IPV6_PREFIX."
  source="$dev"
fi
prefix="$(python3 -c 'import ipaddress, sys; print(ipaddress.IPv6Network(sys.argv[1], strict=False))' "$prefix")" \
  || die "$prefix is not an IPv6 prefix."

info "Docker Engine" "$docker_version"
info "Host prefix" "$prefix ${dim}($source)$reset"

step "daemon.json"
# Merged into whatever is already there, so options set for other reasons
# survive. The IPv4 pools are Docker's own defaults unless some are already
# configured: naming any pool replaces the whole default list.
desired="$(python3 - "$prefix" "$daemon_json" <<'PY'
import ipaddress, json, os, sys

net = ipaddress.IPv6Network(sys.argv[1])
if net.prefixlen != 64:
    sys.exit(f"{net} is not a /64")
base = int(net.network_address)
bridge = ipaddress.IPv6Network((base | (0x0001 << 48), 80))
pool = ipaddress.IPv6Network((base | (0x8000 << 48), 65))

path = sys.argv[2]
config = json.load(open(path)) if os.path.exists(path) and os.path.getsize(path) else {}

ipv4_pools = [p for p in config.get("default-address-pools", [])
              if ipaddress.ip_network(p["base"]).version == 4] or [
    {"base": "172.17.0.0/16", "size": 16},
    {"base": "172.18.0.0/15", "size": 16},
    {"base": "172.20.0.0/14", "size": 16},
    {"base": "172.24.0.0/14", "size": 16},
    {"base": "172.28.0.0/14", "size": 16},
    {"base": "192.168.0.0/16", "size": 20},
]

config["ipv6"] = True
config["fixed-cidr-v6"] = str(bridge)
config.setdefault("default-network-opts", {}).setdefault("bridge", {})[
    "com.docker.network.enable_ipv6"] = "true"
config["default-address-pools"] = ipv4_pools + [{"base": str(pool), "size": 80}]
print(json.dumps(config, indent=2))
PY
)" || die "Could not build the configuration."

current="$(python3 -c 'import json,sys; print(json.dumps(json.load(open(sys.argv[1])), indent=2))' "$daemon_json" 2>/dev/null || true)"
if [[ "$desired" == "$current" ]]; then
  ok "$daemon_json" "already configured"
else
  mkdir -p /etc/docker
  tmp="$(mktemp)"
  printf '%s\n' "$desired" >"$tmp"
  quiet "Validating the new configuration" dockerd --validate --config-file "$tmp"
  if [[ -f "$daemon_json" ]]; then
    backup="$daemon_json.bak.$(date +%Y%m%d%H%M%S)"
    cp "$daemon_json" "$backup"
    info "Backup" "$backup"
  fi
  install -m 0644 "$tmp" "$daemon_json"
  rm -f "$tmp"
  work "$daemon_json" "written, restarting Docker"
  quiet "Restarting Docker" systemctl restart docker
  ok "Docker" "restarted"
fi

compose() {
  # project|working_dir|config_files, as compose labels its containers.
  local project="${1%%|*}" rest="${1#*|}"
  local workdir="${rest%%|*}" files="${rest#*|}" args=() list file
  IFS=, read -ra list <<<"$files"
  for file in "${list[@]}"; do args+=(-f "$file"); done
  quiet "docker compose ${*:2} for $project" \
    docker compose -p "$project" --project-directory "$workdir" "${args[@]}" "${@:2}"
}

step "Networks"
mapfile -t networks < <(docker network ls --filter driver=bridge --format '{{.Name}}')
for net in "${networks[@]}"; do
  [[ "$net" == bridge ]] && continue
  if [[ "$(docker network inspect -f '{{.EnableIPv6}}' "$net")" == true ]]; then
    ok "$net" "has IPv6"
    continue
  fi

  owner="$(docker network inspect -f '{{index .Labels "com.docker.compose.project"}}' "$net")"
  projects=() owner_entry=""
  declare -A seen=()
  while read -r container; do
    [[ -n "$container" ]] || continue
    entry="$(docker inspect -f '{{index .Config.Labels "com.docker.compose.project"}}|{{index .Config.Labels "com.docker.compose.project.working_dir"}}|{{index .Config.Labels "com.docker.compose.project.config_files"}}' "$container")"
    [[ "${entry%%|*}" ]] || die "$net: $container was not started by compose, so it cannot be recreated here. Move it off $net and run again."
    if [[ "${entry%%|*}" == "$owner" ]]; then
      owner_entry="$entry"
    elif [[ -z "${seen[$entry]:-}" ]]; then
      seen[$entry]=1
      projects+=("$entry")
    fi
  done < <(docker ps -a --filter "network=$net" --format '{{.Names}}')

  if [[ -n "$owner" && -z "$owner_entry" ]]; then
    skip "$net" "skipped: project $owner owns it but has no container to recreate it from"
    continue
  fi

  names=()
  [[ -n "$owner_entry" ]] && names+=("${owner_entry%%|*}")
  for entry in "${projects[@]}"; do names+=("${entry%%|*}"); done
  work "$net" "recreating${names[*]:+, restarting ${names[*]}}"

  # Joiners first, so the owner's down can remove the network.
  for entry in "${projects[@]}"; do compose "$entry" down; done
  [[ -n "$owner_entry" ]] && compose "$owner_entry" down
  if docker network inspect "$net" >/dev/null 2>&1; then
    quiet "Removing $net" docker network rm "$net"
  fi
  if [[ -n "$owner_entry" ]]; then
    compose "$owner_entry" up -d
  else
    quiet "Creating $net" docker network create "$net"
  fi
  for entry in "${projects[@]}"; do compose "$entry" up -d; done
  ok "$net" "recreated with IPv6"
done

step "Result"
printf '  %s%-24s %-5s %-18s %s%s\n' "$dim" "NETWORK" "IPV6" "IPV4 SUBNET" "IPV6 SUBNET" "$reset"
docker network ls --filter driver=bridge --format '{{.Name}}' | while read -r net; do
  read -r enabled subnets < <(docker network inspect -f '{{.EnableIPv6}} {{range .IPAM.Config}}{{.Subnet}} {{end}}' "$net")
  v4="-" v6="-"
  for subnet in $subnets; do
    if [[ "$subnet" == *:* ]]; then v6="$subnet"; else v4="$subnet"; fi
  done
  if [[ "$enabled" == true ]]; then mark="${green}yes${reset}  "; else mark="${red}no${reset}   "; fi
  printf '  %-24s %s %-18s %s\n' "$net" "$mark" "$v4" "$v6"
done

printf '\n%s✓ Done.%s Containers now reach what the host reaches over IPv6.\n' "$bold$green" "$reset"
