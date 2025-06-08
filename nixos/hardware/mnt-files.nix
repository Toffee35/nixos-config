{username, ...}: {
  fileSystems."/mnt/Files" = {
    device = "/dev/disk/by-uuid/1dda9791-e185-4dd9-a572-4e919f6d8bbf";
    fsType = "ext4";
    options = [
      "nofail"
      "rw"
      "x-gvfs-show"
    ];

    neededForBoot = false;
  };

  virtualisation.docker.daemon.settings.data-root = "/mnt/Files/Docker";

  systemd.services.docker.unitConfig.ConditionPathIsMountPoint = "/mnt/Files";

  system.activationScripts.fixFilesOwnership.text = ''
    chown -R ${username}:users /mnt/Files || true
  '';

  system.userActivationScripts.linkHomeSymlink.text = ''
    if [ ! -L "$HOME/Files" ]; then
      ln -snf /mnt/Files "$HOME/Files"
    fi
  '';
}
