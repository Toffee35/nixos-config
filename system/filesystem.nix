{ ... }: {
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
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/fed32aea-df07-4e01-8431-9edb9d30fa38"; }];
}
