{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.xclip ];
  services.clipmenu.enable = true;
}
