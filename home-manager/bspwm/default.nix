{
  nixList,
  flakeDir,
  pkgs,
  ...
}: {
  imports = nixList ./.;

  xsession.windowManager.bspwm = {
    enable = true;

    settings = {
      border_width = 1;
      window_gap = 3;
      split_ratio = 0.52;
      focus_follows_pointer = true;
    };

    extraConfig = ''
      bspc monitor -d 1 2 3 4 5 6 7 8 9 10 &
      feh --bg-scale ${flakeDir}/home-manager/bspwm/wallpapers/nix-flake.png &
      polybar main &
    '';
  };

  programs = {
    feh.enable = true;
    rofi.enable = true;
  };

  home.packages = with pkgs; [
    brightnessctl
    pamixer
    scrot
    xcolor
  ];
}
