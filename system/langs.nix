{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      python314 = super.python314.override { includeDocs = false; };
    })
  ];

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
