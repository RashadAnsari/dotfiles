export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH # arm64
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

# export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_AUTO_UPDATE=1

source <(kubectl completion zsh)
source <(stern --completion=zsh)
source <(helm completion zsh)

alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"

eval "$(jump shell)"

# ##########
# Custom Settings
# ##########
