#!/bin/zsh

brew install wget
brew install unzip
brew install jq
brew install yq
brew install htop
brew install telnet
brew install cmake
brew install ngrok
brew install cloudflared

# jump
brew install jump
echo 'eval "$(jump shell)"' >> $HOME/.zshrc

# claude
brew install --cask claude-code
curl -fsSL https://raw.githubusercontent.com/RashadAnsari/myagents/master/install.sh | bash

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# bun
brew tap oven-sh/bun
brew install bun

# jenv
brew install jenv
echo 'eval "$(jenv init -)"' >> $HOME/.zshrc
eval "$(jenv init -)"
jenv enable-plugin export
