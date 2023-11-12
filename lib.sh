#!/bin/zsh

function copyZshEnv {
    mkdir -p $HOME/.zshenvs
    rm -rf $HOME/.zshenvs/$1
    cp ./dev/$1/.zshenv $HOME/.zshenvs/$1
    echo "source \$HOME/.zshenvs/$1" >> $HOME/.zshenv
    source $HOME/.zshenv
}
