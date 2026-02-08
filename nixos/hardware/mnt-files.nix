{username, ...}: {
  fileSystems."/mnt/Files" = {
    device = "/dev/disk/by-uuid/4a898e79-6284-48d2-b573-f1605ba9e728";
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
