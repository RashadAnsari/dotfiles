#!/bin/zsh

rm -rf ~/.scala_zshenv
cp ./scala/.scala_zshenv ~/.scala_zshenv
echo 'source ~/.scala_zshenv' >> ~/.zshenv
source ~/.zshenv

brew install coursier/formulas/coursier && cs setup
