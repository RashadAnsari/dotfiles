#!/bin/zsh

brew install node@14
brew install yarn

brew install nvm
mkdir -p ~/.nvm

rm -rf ~/.node.js_zshenv
cp ./node.js/.node.js_zshenv ~/.node.js_zshenv
echo 'source ~/.node.js_zshenv' >> ~/.zshenv
source ~/.zshenv
