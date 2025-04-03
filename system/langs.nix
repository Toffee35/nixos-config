{ pkgs, ... }: {
  documentation.enable = false;

  environment.systemPackages = with pkgs; [
    python313

    nodejs
    pnpm

    cargo
    cargo-watch
    clang
    llvmPackages.bintools
    rustc

    pkg-config
    openssl

    rustfmt
    clippy
    rust-analyzer

    gcc

    go
  ];
}
