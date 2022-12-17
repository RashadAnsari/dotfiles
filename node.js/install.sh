#!/bin/zsh

brew install node@14
brew install yarn

brew install nvm
mkdir -p $HOME/.nvm

mkdir -p $HOME/.zshenvs
rm -rf $HOME/.zshenvs/node.js
cp ./node.js/.zshenv $HOME/.zshenvs/node.js
echo 'source $HOME/.zshenvs/node.js' >> $HOME/.zshenv
source $HOME/.zshenv
