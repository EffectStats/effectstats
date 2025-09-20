{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.R
    pkgs.zlib
    pkgs.zlib.dev
    pkgs.rPackages.remotes   # lowercase!
    pkgs.pkg-config
    pkgs.curl
    pkgs.openssl
    pkgs.libxml2
  ];
}
