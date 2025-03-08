{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager

    google-chrome
    lutris
    obs-studio
    obsidian

    telegram-desktop
    discord-ptb
    whatsapp-for-linux

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
    blender
    natron
    olive-editor
    davinci-resolve
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
