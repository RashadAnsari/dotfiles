#!/bin/zsh

if [ -x "$(command -v gcloud)" ]; then
    return
fi

VERSION=410.0.0

rm -rf ~/google-cloud-sdk

arch=$(uname -m)

if  [[ $arch == x86_64 ]]; then
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-$VERSION-darwin-x86.tar.gz -P ~/
    tar -xf ~/google-cloud-cli-$VERSION-darwin-x86.tar.gz -C ~/
    rm -rf ~/google-cloud-cli-$VERSION-darwin-x86.tar.gz
elif  [[ $arch == arm64 ]]; then
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-$VERSION-darwin-arm.tar.gz -P ~/
    tar -xf ~/google-cloud-cli-$VERSION-darwin-arm.tar.gz -C ~/
    rm -rf ~/google-cloud-cli-$VERSION-darwin-arm.tar.gz
fi

~/google-cloud-sdk/install.sh --usage-reporting=false --command-completion=false --path-update=false --install-python=false

# or

# brew install --cask google-cloud-sdk

# ----------

mkdir -p ~/.zshenvs
rm -rf ~/.zshenvs/gcloud
cp ./gcloud/.zshenv ~/.zshenvs/gcloud
echo 'source ~/.zshenvs/gcloud' >> ~/.zshenv
source ~/.zshenv
