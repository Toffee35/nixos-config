{ pkgs, lib, ... }: {
  services.xserver.windowManager.dwm = {
    enable = true;

    package = pkgs.dwm.override {
      conf = ./config.h;
      patches = [ ];
    };

    extraSessionCommands = ''
      xsetroot -solid "#282828"
      while xsetroot -name "`date`"
      do
        sleep 1
      done &
    '';
  };

  services.displayManager.defaultSession = "none+dwm";
}
