{config, ...}: {
  boot.blacklistedKernelModules = ["nouveau" "i915"];

  hardware = {
    nvidia = {
      modesetting.enable = true;

      nvidiaSettings = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      open = false;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  services.xserver = {
    videoDrivers = [
      "nvidia"
    ];

    screenSection = "Option \"PrimaryGPU\" \"yes\"";
  };
}
