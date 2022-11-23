#!/bin/zsh

brew install go
brew install golangci-lint
brew upgrade golangci-lint

rm -rf ~/.go_zshenv
cp ./go/.go_zshenv ~/.go_zshenv
echo 'source ~/.go_zshenv' >> ~/.zshenv
source ~/.zshenv
