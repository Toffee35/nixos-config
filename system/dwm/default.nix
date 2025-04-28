{ pkgs, lib, ... }: {
  services.xserver.windowManager.dwm = {
    enable = true;

    package = pkgs.dwm.override {
      conf = ./config.h;
      patches = [ ];
    };
  };

  services.displayManager.defaultSession = lib.mkForce "dwm";
}
