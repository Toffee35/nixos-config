{ ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    timeout = 2;

    grub = {
      efiSupport = true;
      device = "nodev";
      splashImage = null;
    };
  };
}
