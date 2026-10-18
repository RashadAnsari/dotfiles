# dotfiles

My macOS setup: one script that takes a fresh Mac to a working dev machine. It installs the Xcode Command Line Tools, Oh My Zsh, Homebrew and my apps and CLI tools, and copies my shell and git config into place.

## What `install.sh` does

Steps run in this order:

| Step | Script | What it does |
|---|---|---|
| Xcode CLT | [lib.sh](lib.sh) | Installs the Command Line Tools if missing and waits for the installer to finish |
| zsh | [dev/zsh/install.sh](dev/zsh/install.sh) | Oh My Zsh, the `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins, the `albino` theme, `.zshrc`, `.zshenv`, `.hushlogin` |
| Homebrew | [dev/brew/install.sh](dev/brew/install.sh) | Installs Homebrew non-interactively, then `brew upgrade` |
| CLI tools | [dev/tools/install.sh](dev/tools/install.sh) | wget, jq, yq, htop, cmake, ngrok, cloudflared, jump, uv, bun, jenv, Claude, Claude Code, Codex, [myagents](https://github.com/RashadAnsari/myagents), free-claude-code |
| Go | [dev/go/install.sh](dev/go/install.sh) | Go, plus its env vars in `~/.zshenvs/go` |
| git | [dev/git/install.sh](dev/git/install.sh) | `.gitconfig`, plus `rebase-main` / `rebase-master` aliases |
| SSH | [dev/ssh/install.sh](dev/ssh/install.sh) | Generates `~/.ssh/id_rsa` if it doesn't exist |
| Apps | [apps/install.sh](apps/install.sh) | Hyper (with `.hyper.js`), Chrome, Telegram, Spotify, NordVPN, Tailscale, PureMac, OpenMTP, VS Code, Docker, IntelliJ IDEA CE, [MagicBridge](https://github.com/RashadAnsari/MagicBridge) |

## Use it

Comment out the lines you don't want in [install.sh](install.sh) or the per-step scripts, then run from the repo root:

```bash
./install.sh
```

Don't run it with `sudo`: the Homebrew installer refuses to run as root, and the files would be written for the wrong user. It asks for your password when it needs one.

It **replaces** `~/.zshrc`, `~/.zshenv`, `~/.gitconfig` and `~/.hyper.js`, so back up your own versions first. Running it again is safe: the shell files are reset before anything is added to them.

If you fork this, change the name and email in [dev/git/.gitconfig](dev/git/.gitconfig) and the SSH key comment in [dev/ssh/install.sh](dev/ssh/install.sh).

## Other config

Kept here for reference; `install.sh` doesn't touch these:

- [cfg/vscode/main.code-profile](cfg/vscode/main.code-profile): VS Code profile. Import it with *Profiles → Import Profile*.
- [cfg/ansible/](cfg/ansible/): Ansible config and an inventory template.
- [cfg/cloudflare/outbound-email.md](cfg/cloudflare/outbound-email.md): sending mail from a Cloudflare Email Routing address through Gmail SMTP.

## License

[MIT](LICENSE)
