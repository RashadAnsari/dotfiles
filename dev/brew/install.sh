#!/bin/zsh

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# A fresh install isn't on PATH yet, and every later step needs brew.
if [[ $(uname -m) == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

brew upgrade
