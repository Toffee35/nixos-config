{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustup
    cargo-binstall
    cargo-watch

    gcc

    python3

    nodejs
  ];
}
