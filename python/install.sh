#!/bin/zsh

echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshenv # Apple Silicon
# echo 'export PATH=/usr/local/bin:$PATH' >> ~/.zshenv # x86

echo 'export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true' >> ~/.zshenv
echo 'export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true' >> ~/.zshenv

brew upgrade

brew install zlib
echo 'export LDFLAGS="${LDFLAGS} -L$(brew --prefix)/opt/zlib/lib"' >> ~/.zshenv
echo 'export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix)/opt/zlib/include"' >> ~/.zshenv
echo 'export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix)/opt/zlib/lib/pkgconfig"' >> ~/.zshenv

brew install libffi
echo 'export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix)/opt/libffi/lib/pkgconfig"' >> ~/.zshenv

brew install openssl
echo 'export LDFLAGS="${LDFLAGS} -L$(brew --prefix)/opt/openssl@3/lib"' >> ~/.zshenv
echo 'export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix)/opt/openssl@3/include"' >> ~/.zshenv

brew install cairo
brew install libxmlsec1
brew install readline
brew install sqlite3
brew install xz
brew install pango
brew install postgresql
# brew install python@3.8

# brew uninstall curl
# brew install curl-openssl
# echo 'export LDFLAGS="${LDFLAGS} -L$(brew --prefix)/opt/curl/lib"' >> ~/.zshenv
# echo 'export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix)/opt/curl/include"' >> ~/.zshenv
# echo 'export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix)/opt/curl/lib/pkgconfig"' >> ~/.zshenv
# echo 'export PATH="$(brew --prefix)/opt/curl/bin:$PATH"' >> ~/.zshenv

pip3 install poetry==1.1.12
poetry config virtualenvs.in-project true
# poetry env use <YOUR-PYTHON-3.8-BINARY-PATH>

source ~/.zshenv
