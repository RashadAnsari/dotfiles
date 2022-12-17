#!/bin/zsh

brew install php@8.1
brew install composer

mkdir -p $HOME/.zshenvs
rm -rf $HOME/.zshenvs/php
cp ./php/.zshenv $HOME/.zshenvs/php
echo 'source $HOME/.zshenvs/php' >> $HOME/.zshenv
source $HOME/.zshenv
