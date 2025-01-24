{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustup
    cargo-binstall
    cargo-watch

    gcc

    python313
    python313Packages.pip
    python313Packages.virtualenv

    nodejs
  ];
}
