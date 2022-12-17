#!/bin/zsh

brew install go
brew install golangci-lint
brew upgrade golangci-lint

mkdir -p $HOME/.zshenvs
rm -rf $HOME/.zshenvs/go
cp ./go/.zshenv $HOME/.zshenvs/go
echo 'source $HOME/.zshenvs/go' >> $HOME/.zshenv
source $HOME/.zshenv
