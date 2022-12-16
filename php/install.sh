#!/bin/zsh

brew install php@8.1
brew install composer

mkdir -p ~/.zshenvs
rm -rf ~/.zshenvs/php
cp ./php/.zshenv ~/.zshenvs/php
echo 'source ~/.zshenvs/php' >> ~/.zshenv
source ~/.zshenv
