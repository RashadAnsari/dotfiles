#!/bin/zsh

brew install wget
brew install unzip
brew install jq
brew install yq
brew install htop
brew install telnet
brew install cmake
brew install gemini-cli

brew install jump
echo 'eval "$(jump shell)"' >> $HOME/.zshrc

# Cursor CLI
curl https://cursor.com/install -fsS | bash
