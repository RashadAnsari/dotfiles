#!/bin/zsh

brew install --cask hyper
rm -rf $HOME/.hyper.js
cp ./apps/.hyper.js $HOME/.hyper.js

# Personal
brew install --cask google-chrome
brew install --cask telegram
brew install --cask spotify
brew install --cask nordvpn
brew install --cask tailscale
brew install --cask puremac
# https://apps.apple.com/us/app/hp-smart-for-desktop/id1474276998

# MagicBridge
brew tap rashadansari/magicbridge https://github.com/RashadAnsari/MagicBridge
brew install --cask magicbridge

# Coding
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask intellij-idea-ce
