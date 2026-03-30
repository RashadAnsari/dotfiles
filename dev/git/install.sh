#!/bin/zsh

rm -rf $HOME/.gitconfig
cp ./dev/git/.gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore
cp ./dev/git/.gitignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

copyZshEnv git
