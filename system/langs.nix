{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313Full
    python313Packages.pip

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

    go
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
