{ pkgs, lib, ... }: {
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm;
  };
}
