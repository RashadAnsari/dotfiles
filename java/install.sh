#!/bin/zsh

brew install java

mkdir -p $HOME/.zshenvs
rm -rf $HOME/.zshenvs/java
cp ./java/.zshenv $HOME/.zshenvs/java
echo 'source $HOME/.zshenvs/java' >> $HOME/.zshenv
source $HOME/.zshenv
