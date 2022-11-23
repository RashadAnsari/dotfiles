#!/bin/zsh

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if  [[ ! $(which brew) ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi

brew upgrade

brew install wget
brew install jump
brew install thefuck
brew install unzip
brew install jq
brew install yq
