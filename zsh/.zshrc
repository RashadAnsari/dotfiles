arch=$(uname -m)

if  [[ $arch == x86_64 ]]; then
    export BREW_PREFIX=/usr/local
    export PATH=$HOME/bin:$BREW_PREFIX/bin:$PATH
elif  [[ $arch == arm64 ]]; then
    export BREW_PREFIX=/opt/homebrew
    export PATH=$HOME/bin:/usr/local/bin:$BREW_PREFIX/bin:$PATH
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="albino"
ZSH_DISABLE_COMPFIX="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  thefuck
)

source $ZSH/oh-my-zsh.sh

export LANG="en_US.UTF-8"
export EDITOR="vim"

prompt_context(){}

# ##########
# Custom Settings
# ##########

# Golang

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH/bin:$PATH

# Python

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/shims:$PATH"
# export PIPENV_VENV_IN_PROJECT="enabled"

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Java

export PATH="$BREW_PREFIX/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I$BREW_PREFIX/opt/openjdk/include $CPPFLAGS"

# Node.js

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# PHP

# export PATH=$HOME/.composer/vendor/bin:$PATH

# Tools

# export HOMEBREW_NO_GITHUB_API=1
# export HOMEBREW_NO_AUTO_UPDATE=1

# source <(kubectl completion zsh)
# source <(stern --completion=zsh)
# source <(helm completion zsh)

# alias k="kubectl"
# alias kns="kubens"
# alias kctx="kubectx"

eval "$(jump shell)"

# ##########
# Custom Settings
# ##########
