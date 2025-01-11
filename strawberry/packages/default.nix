{ pkgs, pkgs-stable, ...}: {
  imports = [
    ./alacritty
    ./awesome
    ./clipcat
    ./rec
    ./rofi
    ./sddm
    ./zsh

    ./doas.nix
    ./docker.nix
    ./fonts.nix
    ./langs.nix
    ./prism.nix
    ./thunar.nix
    ./tmux.nix
    ./xorg.nix
  ];

  environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    postman
    discord
    telegram-desktop
    transmission_4-gtk
    flatpak
    blender-hip
    figma-linux
    obs-studio
    obsidian
    libsForQt5.kate
    eog
    vlc
    aseprite
    lutris
    mindustry
    winbox
    nix-prefetch-git
    home-manager
    jellyfin-ffmpeg
    p7zip
    wget
    xcolor
    mongosh
  ];

  programs = {
    firefox.enable = true;
    nano.enable = true;
    git.enable = true;
    direnv.enable = true;
    dconf.enable = true;
  };

  networking.networkmanager.enable = true;

  services.cloudflare-warp.enable = true;


  nixpkgs.config = {
    allowUnfree = true;
  };
}
