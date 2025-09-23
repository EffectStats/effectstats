{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.R
    pkgs.zlib
    pkgs.zlib.dev
    pkgs.rPackages.remotes
    pkgs.pkg-config
    pkgs.curl
    pkgs.openssl
    pkgs.libxml2
    pkgs.gettext

    # system deps for building packages
    pkgs.nanomsg
    pkgs.libuuid
    pkgs.gcc
    pkgs.gnumake

    # R packages available in nixpkgs
    pkgs.rPackages.nanonext
    pkgs.rPackages.ellmer
  ];
}
