{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    google-chrome
    alacritty
    lutris
    obs-studio
    obsidian
    telegram-desktop
  ];

  programs = {
    tmux.enable = true;
    firefox.enable = true;
    nano.enable = true;
    git.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
