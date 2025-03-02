{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.xsel ];

  services.clipmenu.enable = true;

  environment.variables.CM_LAUNCHER = "rofi";
}
