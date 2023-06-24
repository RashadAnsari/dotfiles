#!/bin/zsh

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if ! [ -x "$(command -v brew)" ]; then
    export PATH=/opt/homebrew/bin:$PATH
fi

brew upgrade

brew install jump
brew install thefuck

brew install wget
brew install unzip
brew install jq
brew install yq
brew install htop

brew install kubectl
brew install stern
brew install helm
brew install kubectx

brew install jsonnet

brew install ansible
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terragrunt
# brew install tfenv
brew install infracost

brew install awscli

brew install mongosh
