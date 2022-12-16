#!/bin/zsh

brew install go
brew install golangci-lint
brew upgrade golangci-lint

mkdir -p ~/.zshenvs
rm -rf ~/.zshenvs/go
cp ./go/.zshenv ~/.zshenvs/go
echo 'source ~/.zshenvs/go' >> ~/.zshenv
source ~/.zshenv
