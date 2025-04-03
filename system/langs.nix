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

    (rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })

    gcc

    go
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    LIBCLANG_PATH =
      pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
  };
}
