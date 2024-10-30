#!/bin/zsh

sh <(curl -L https://nixos.org/nix/install)
echo 'alias nix-shell="nix-shell --command zsh"' >> $HOME/.zshrc
copyZshEnv nix
