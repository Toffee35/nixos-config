{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nixfmt-classic
    alacritty
    curl
    wget
    lutris
  ];

  programs = {
    tmux.enable = true;
    firefox.enable = true;
    nano.enable = true;
    git.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
