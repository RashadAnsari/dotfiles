#!/bin/zsh

brew install wget
brew install unzip
brew install jq
brew install yq
brew install htop
brew install telnet
brew install cmake

# jump
brew install jump
echo 'eval "$(jump shell)"' >> $HOME/.zshrc

# claude
brew install --cask claude
brew install --cask claude-code

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh
# ruflo
curl -fsSL https://cdn.jsdelivr.net/gh/ruvnet/ruflo@main/scripts/install.sh | bash

# bun
brew tap oven-sh/bun
brew install bun
