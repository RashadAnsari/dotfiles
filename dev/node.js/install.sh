#!/bin/zsh

brew install node@20
brew install yarn

brew install nvm
mkdir -p $HOME/.nvm

copyZshEnv node.js
