{ username, ... }: {
  boot.supportedFilesystems = [ "ext4" "vfat" "btrfs" "ntfs" ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/45242645-bc48-4dca-bf28-aef2eeace4e8";
      fsType = "ext4";
    };

    "/boot/efi" = {
      device = "/dev/disk/by-uuid/D084-84AC";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/mnt/Files" = {
      device = "/dev/disk/by-uuid/ec25dba3-8357-4953-9367-1a282646af2c";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
        "x-systemd.automount"
        "x-systemd.mount-timeout=1s"
        "x-systemd.idle-timeout=0"
        "umask=777"
        # "uid=1000"
        # "gid=992"
      ];
    };
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/fed32aea-df07-4e01-8431-9edb9d30fa38"; }];
}
