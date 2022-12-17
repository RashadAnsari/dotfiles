#!/bin/zsh

brew install --cask google-cloud-sdk

mkdir -p $HOME/.zshenvs
rm -rf $HOME/.zshenvs/gcloud
cp ./gcloud/.zshenv $HOME/.zshenvs/gcloud
echo 'source $HOME/.zshenvs/gcloud' >> $HOME/.zshenv
source $HOME/.zshenv
