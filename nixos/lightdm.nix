{homedir, ...}: {
  ervices.xserver.displayManager.lightdm = {
    enable = true;

    background = "${homedir}/wallpapers/nix-flake.png";
  };
}
