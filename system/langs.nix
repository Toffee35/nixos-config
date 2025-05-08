{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    python314Full
    ruff
    mypy
    pyright
    pylint

    nodejs
    pnpm

    pkg-config
    openssl
    openssl.dev

    rustc
    cargo
    cargo-watch
    rustfmt
    clippy
    rust-analyzer

    gcc
    clang
    llvmPackages.bintools
    stdenv.cc.cc.lib

    go
  ];

  environment.variables = {
    LD_LIBRARY_PATH = lib.mkForce "${pkgs.stdenv.cc.cc.lib}/lib";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
