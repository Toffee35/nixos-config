{ pkgs, ... }: {
  documentation.enable = false;

  environment.systemPackages = with pkgs; [
    python313

    nodejs
    pnpm

    cargo
    rustup
    cargo-watch

    gcc

    go
  ];
}
