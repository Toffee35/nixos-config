{ pkgs, ... }: {
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm;
  };

  displayManager.defaultSession = lib.mkForce "dwm";
}
