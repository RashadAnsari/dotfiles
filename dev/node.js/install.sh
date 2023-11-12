#!/bin/zsh

brew install node@18
brew install yarn

brew install nvm
mkdir -p $HOME/.nvm

copyZshEnv node.js
