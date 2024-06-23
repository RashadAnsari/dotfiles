#!/bin/bash

source lib.sh

install_xcode_tools
./dev/zsh/install.sh

source dev/brew/install.sh
source dev/tools/install.sh
source dev/git/install.sh
source dev/vim/install.sh
source dev/ssh/install.sh
source apps/install.sh
source dev/nix/install.sh
