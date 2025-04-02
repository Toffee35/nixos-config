{ pkgs, ... }: {
  documentation.enable = false;

  environment.systemPackages = with pkgs; [
    python313

    nodejs
    pnpm

    cargo
    rustc
    cargo-watch

    gcc

    go
  ];
}
