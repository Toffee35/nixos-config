{ pkgs, ... }: {
  documentation.enable = false;

  environment.systemPackages = with pkgs; [
    python314

    nodejs
    pnpm

    cargo
    rustc
    cargo-watch

    gcc

    go
  ];
}
