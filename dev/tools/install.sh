#!/bin/zsh

brew install wget
brew install unzip
brew install jq
brew install yq
brew install htop
brew install telnet
brew install cmake

# jump
brew install jump
echo 'eval "$(jump shell)"' >> $HOME/.zshrc

# claude
brew install --cask claude
brew install --cask claude-code
echo 'alias ruflo="bunx ruflo@latest init"' >> $HOME/.zshrc

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# bun
brew tap oven-sh/bun
brew install bun

# jenv
brew install jenv
echo 'eval "$(jenv init -)"' >> $HOME/.zshrc
eval "$(jenv init -)"
jenv enable-plugin export

# free-claude-code
# https://github.com/Alishahryar1/free-claude-code
uv tool install git+https://github.com/Alishahryar1/free-claude-code.git
fcc-init
echo 'alias free-claude="ANTHROPIC_AUTH_TOKEN=freecc ANTHROPIC_BASE_URL=http://localhost:8082 CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1 claude"' >> $HOME/.zshrc
