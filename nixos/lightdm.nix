{homedir, ...}: {
  services.xserver.displayManager.lightdm = {
    enable = true;

    background = "${homedir}/wallpapers/nix-flake.png";
  };
}
