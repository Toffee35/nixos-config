{ lib, ... }: {
  services = {
    xserver.windowManager.qtile.enable = true;
    displayManager.defaultSession = lib.mkForce "qtile";
  };
}
