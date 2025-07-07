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
)

source $ZSH/oh-my-zsh.sh

export LANG="en_US.UTF-8"
export EDITOR="vim"

# Gemini CLI
# export GOOGLE_CLOUD_PROJECT="MY_GOOGLE_CLOUD_PROJECT"
# export GEMINI_API_KEY="MY_GEMINI_API_KEY"
