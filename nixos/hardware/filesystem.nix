{...}: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/5c04097d-925a-4ec0-a7a5-293fd695dc9c";
      fsType = "ext4";
    };

    "/boot/efi" = {
      device = "/dev/disk/by-uuid/230E-F92A";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/1b66f9e0-979d-411c-b193-03ea0db0270a";
    }
  ];
}
