{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs-18_x
    pkgs.yarn
  ];

  shellHook = ''
    if [ ! -d node_modules ]; then
      yarn install
    fi
  '';
}
