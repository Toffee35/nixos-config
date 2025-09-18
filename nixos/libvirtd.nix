{
  username,
  pkgs,
  ...
}: {
  boot = {
    kernelModules = ["kvm-intel"];
    extraModprobeConfig = "options kvm_intel nested=1";
  };

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs.qemu_kvm;
        vhostUserPackages = [pkgs.virtiofsd];
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
      };
    };

    spiceUSBRedirection.enable = true;
  };

  users.groups.libvirtd.members = [username];

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  networking = {
    useDHCP = false;
    useNetworkd = true;
  };

  systemd.network = {
    enable = true;

    netdevs."br0" = {
      Kind = "bridge";
      Name = "br0";
    };

    networks = {
      "10-br0-dhcp" = {
        Name = "br0";
        DHCP = "ipv4";
      };

      "20-ethernet-br0" = {
        Name = "enp2s0f1";
        Network = "br0";
      };
    };
  };

  networking.firewall.checkReversePath = "loose";
}
