arch=$(uname -m)

if  [[ $arch == x86_64 ]]; then
    export BREW_PREFIX=/usr/local
elif  [[ $arch == arm64 ]]; then
    export BREW_PREFIX=/opt/homebrew
fi
