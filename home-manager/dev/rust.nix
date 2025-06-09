{
  pkgs,
  username,
  ...
}: {
  home = {
    packages = with pkgs; [
      pkg-config
      openssl
      sqlite

      cargo
      rustc
      gcc

      rustfmt

      jetbrains.rust-rover
    ];

    sessionVariables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    tamasfe.even-better-toml
    fill-labs.dependi
    vadimcn.vscode-lldb
  ];
}
