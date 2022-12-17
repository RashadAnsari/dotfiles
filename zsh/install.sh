#!/bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

rm -rf $HOME/.zshrc
cp ./zsh/.zshrc $HOME/.zshrc

rm -rf $HOME/.zshenv
cp ./zsh/.zshenv $HOME/.zshenv

cp ./zsh/albino.zsh-theme ${ZSH}/themes/albino.zsh-theme
touch $HOME/.hushlogin

source $HOME/.zshrc
