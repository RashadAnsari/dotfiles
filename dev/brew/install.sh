#!/bin/zsh

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

copyZshEnv brew

brew upgrade
# brew tap homebrew/core
# brew install hashicorp/tap/terraform
