#!/bin/zsh

brew install node@14
brew install yarn

brew install nvm
mkdir -p ~/.nvm

mkdir -p ~/.zshenvs
rm -rf ~/.zshenvs/node.js
cp ./node.js/.zshenv ~/.zshenvs/node.js
echo 'source ~/.zshenvs/node.js' >> ~/.zshenv
source ~/.zshenv
