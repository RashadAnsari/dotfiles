#!/bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

rm -rf ~/.zshrc
cp ./zsh/.zshrc ~/.zshrc

rm -rf ~/.zshenv
cp ./zsh/.zshenv ~/.zshenv

cp ./zsh/albino.zsh-theme ${ZSH}/themes/albino.zsh-theme
touch ~/.hushlogin

source ~/.zshrc
