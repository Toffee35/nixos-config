{ pkgs, ... }: {
  documentation.enable = false;

  environment.systemPackages = with pkgs; [
    python313

    nodejs
    pnpm

    cargo
    rustup
    cargo-watch

    pkg-config
    openssl
    openssl.dev

    (rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" "rustfmt" ];
    })

    cmake
    perl

    gcc

    go
  ];

  environment.variables = {
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
