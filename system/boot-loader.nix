{ ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    grub = {
      efiSupport = true;
      device = "nodev";
      splashImage = null;
    };
  };
}
