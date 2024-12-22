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
    obsidian
    transmission_4-gtk
    libsForQt5.kate
    eog
    vlc
    mindustry
    aseprite
    blender-hip
    figma-linux
    
    lutris

    nix-prefetch-git
    home-manager
    jellyfin-ffmpeg
    p7zip
    wget
    xcolor
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
