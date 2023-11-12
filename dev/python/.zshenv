export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true

export LDFLAGS="-L$BREW_PREFIX/opt/zlib/lib ${LDFLAGS}"
export CPPFLAGS="-I$BREW_PREFIX/opt/zlib/include ${CPPFLAGS}"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/zlib/lib/pkgconfig ${PKG_CONFIG_PATH}"

export LDFLAGS="-L$BREW_PREFIX/opt/libffi/lib ${LDFLAGS}"
export CPPFLAGS="-I$BREW_PREFIX/opt/libffi/include ${CPPFLAGS}"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/libffi/lib/pkgconfig ${PKG_CONFIG_PATH}"

export LDFLAGS="-L$BREW_PREFIX/opt/openssl@3/lib ${LDFLAGS}"
export CPPFLAGS="-I$BREW_PREFIX/opt/openssl@3/include ${CPPFLAGS}"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/openssl@3/lib/pkgconfig ${PKG_CONFIG_PATH}"

export LDFLAGS="-L$BREW_PREFIX/opt/curl/lib ${LDFLAGS}"
export CPPFLAGS="-I$BREW_PREFIX/opt/curl/include ${CPPFLAGS}"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/curl/lib/pkgconfig ${PKG_CONFIG_PATH}"

alias python="python3"
alias activate-venv="source .venv/bin/activate"
alias python-venv="poetry env use $(which python3)"
