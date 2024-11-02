{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python311
  ];

  shellHook = ''
    if [ -e .venv ]; then
      source .venv/bin/activate
    else
      python -m venv .venv
      source .venv/bin/activate
      pip3 install --upgrade pip
      pip3 install poetry==1.7.1
      poetry config virtualenvs.create false
      poetry install
    fi
  '';
}
