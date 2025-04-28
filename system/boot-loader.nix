{ ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    timeout = 2;

    grub = {
      enable = true;

      efiSupport = true;
      device = "nodev";

      splashImage = null;
    };
  };
}
