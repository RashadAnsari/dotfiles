#!/bin/zsh

brew install zlib
brew install libffi
brew install openssl
brew install cairo
brew install libxmlsec1
brew install readline
brew install sqlite3
brew install xz
brew install pango
brew install postgresql
brew install curl-openssl

brew install python@3.8
python3 -m pip install --upgrade pip
pip3 install poetry==1.1.12
poetry config virtualenvs.in-project true

rm -rf ~/.python_zshenv
cp ./python/.python_zshenv ~/.python_zshenv
echo 'source ~/.python_zshenv' >> ~/.zshenv
source ~/.zshenv
