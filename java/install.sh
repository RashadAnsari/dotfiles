#!/bin/zsh

brew install java

rm -rf ~/.java_zshenv
cp ./java/.java_zshenv ~/.java_zshenv
echo 'source ~/.java_zshenv' >> ~/.zshenv
source ~/.zshenv
