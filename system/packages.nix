{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager

    google-chrome
    lutris
    obs-studio
    obsidian
    postman

    telegram-desktop
    discord

    curl
    wget

    ffmpeg
    pamixer
    brightnessctl
    scrot
    xcolor

    nixfmt-classic
    vscodium

    btop
    fastfetch

    gimp
    krita
    blender
    davinci-resolve
    figma-linux
  ];

  programs = {
    direnv.enable = true;
    tmux.enable = true;
    firefox.enable = true;
    nano.enable = true;
    git.enable = true;
    dconf.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
