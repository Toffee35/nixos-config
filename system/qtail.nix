{ ... }: {
  services.xserver.windowManager.qtile = {
    enable = true;
    configFile = ../configs/qtile/config.py;
  };
}
