#!/bin/zsh

mkdir -p $HOME/.zshenvs
rm -rf $HOME/.zshenvs/scala
cp ./scala/.zshenv $HOME/.zshenvs/scala
echo 'source $HOME/.zshenvs/scala' >> $HOME/.zshenv
source $HOME/.zshenv

brew install coursier/formulas/coursier && cs setup
