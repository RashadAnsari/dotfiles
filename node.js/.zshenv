export PATH="$BREW_PREFIX/opt/node@14/bin:$PATH"

export LDFLAGS="-L$BREW_PREFIX/opt/node@14/lib $LDFLAGS"
export CPPFLAGS="-I$BREW_PREFIX/opt/node@14/include $CPPFLAGS"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"
  [ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
