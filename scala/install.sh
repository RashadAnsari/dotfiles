#!/bin/zsh

mkdir -p ~/.zshenvs
rm -rf ~/.zshenvs/scala
cp ./scala/.zshenv ~/.zshenvs/scala
echo 'source ~/.zshenvs/scala' >> ~/.zshenv
source ~/.zshenv

brew install coursier/formulas/coursier && cs setup
