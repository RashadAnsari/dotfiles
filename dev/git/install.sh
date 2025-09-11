#!/bin/zsh

rm -rf $HOME/.gitconfig
cp ./dev/git/.gitconfig $HOME/.gitconfig

copyZshEnv git
