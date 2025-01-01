{ hostName, systemVersion, timeZone, config, pkgs, pkgs-stable, ... }: {
  imports = [
    ./audio/pipewire.nix
    ./bluetooth
    ./networking/firewall.nix
    ./samba
    ./ssh
    ./user
    ./video/nvidia.nix
  ];

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernelModules = [ "v4l2loopback" ];
    kernelPackages = pkgs-stable.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    inherit hostName;
  };

  time = {
    inherit timeZone;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = systemVersion;
}
