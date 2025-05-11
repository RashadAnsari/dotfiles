#!/bin/zsh

brew install --cask hyper
rm -rf $HOME/.hyper.js
cp ./apps/.hyper.js $HOME/.hyper.js

# Personal
brew install --cask google-chrome
brew install --cask telegram
brew install --cask spotify
# https://apps.apple.com/us/app/hp-smart-for-desktop/id1474276998

# Coding
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask trae
brew install --cask docker

# Work
# brew install --cask slack
# brew install --cask notion
# brew install --cask bitwarden
