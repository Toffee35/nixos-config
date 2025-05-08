{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager
    nixfmt-classic

    chromium
    lutris
    obsidian
    vscodium
    jetbrains.pycharm-community
    postman
    telegram-desktop
    discord
    gimp
    peazip

    curl
    wget
    btop
    fastfetch
    ffmpeg
    pamixer
    brightnessctl
    scrot
    xcolor
    p7zip
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
