#!/bin/zsh

function install_xcode_tools {
    if ! xcode-select -p &>/dev/null; then
        echo "Xcode Command Line Tools are not installed. Installing now..."
        xcode-select --install
        echo "Waiting for the installation to complete..."
        while true; do
            if xcode-select -p &>/dev/null; then
                echo "Installation completed."
                break
            fi
            sleep 10
        done
    fi
}

function copyZshEnv {
    mkdir -p $HOME/.zshenvs
    rm -rf $HOME/.zshenvs/$1
    cp ./dev/$1/.zshenv $HOME/.zshenvs/$1
    echo "source \$HOME/.zshenvs/$1" >> $HOME/.zshenv
    source $HOME/.zshenv
}
