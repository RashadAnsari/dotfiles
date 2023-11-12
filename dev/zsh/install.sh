#!/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

rm -rf $HOME/.zshrc
cp ./dev/zsh/.zshrc $HOME/.zshrc

rm -rf $HOME/.zshenv
cp ./dev/zsh/.zshenv $HOME/.zshenv

rm -rf $HOME/.oh-my-zsh/themes/albino.zsh-theme
cp ./dev/zsh/albino.zsh-theme $HOME/.oh-my-zsh/themes/albino.zsh-theme

rm -rf $HOME/.hushlogin
touch $HOME/.hushlogin

source $HOME/.zshrc
