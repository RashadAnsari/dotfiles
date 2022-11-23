#!/bin/zsh

brew install php@8.1
brew install composer

rm -rf ~/.php_zshenv
cp ./php/.php_zshenv ~/.php_zshenv
echo 'source ~/.php_zshenv' >> ~/.zshenv
source ~/.zshenv
