{ lib, pkgs, ... }: {
  services = {
    xserver.windowManager.qtile = {
      enable = true;
      package = pkgs.python313Packages.qtile;
    };
    displayManager.defaultSession = lib.mkForce "qtile";
  };
}
