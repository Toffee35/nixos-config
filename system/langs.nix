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
    openssl.dev

    rustfmt
    clippy
    rust-analyzer

    gcc

    go
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
