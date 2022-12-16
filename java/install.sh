#!/bin/zsh

brew install java

mkdir -p ~/.zshenvs
rm -rf ~/.zshenvs/java
cp ./java/.zshenv ~/.zshenvs/java
echo 'source ~/.zshenvs/java' >> ~/.zshenv
source ~/.zshenv
