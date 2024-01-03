#!/bin/bash

source lib.sh

./dev/zsh/install.sh

source dev/brew/install.sh
source dev/nix/install.sh
source dev/tools/install.sh
source dev/git/install.sh
source dev/vim/install.sh
source dev/ssh/install.sh
source dev/go/install.sh
source dev/python/install.sh
source dev/node.js/install.sh
# source dev/php/install.sh
# source dev/java/install.sh
# source dev/scala/install.sh

source apps/install.sh
