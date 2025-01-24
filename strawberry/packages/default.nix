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
    amnezia-vpn
    google-chrome
    vscode
    postman
    discord
    telegram-desktop
    transmission_4-gtk
    obs-studio
    obsidian
    eog
    vlc
    lutris
    mindustry
    
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
