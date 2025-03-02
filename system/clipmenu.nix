{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.xclip ];

  services.clipmenu.enable = true;

  environment.etc."xdg/clipmenu/config".text = ''
    CM_LAUNCHER=rofi
  '';
}
