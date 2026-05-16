#!/bin/zsh

rm -rf $HOME/.gitconfig
cp ./dev/git/.gitconfig $HOME/.gitconfig

echo 'alias rebase-main="git fetch origin && git rebase origin/main"' >> $HOME/.zshrc
echo 'alias rebase-master="git fetch origin && git rebase origin/master"' >> $HOME/.zshrc
