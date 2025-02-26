{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    google-chrome
    lutris
    obs-studio
    obsidian
    telegram-desktop
    curl
    wget
    ffmpeg
    btop
    fastfetch
    nixfmt-classic
    vscodium
    pamixer
    brightnessctl
    scrot
    python314
  ];

  programs = {
    direnv.enable = true;
    tmux.enable = true;
    firefox.enable = true;
    nano.enable = true;
    git.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
