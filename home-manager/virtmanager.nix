{
  pkgs,
  lib,
  homedir,
  ...
}: {
  home.packages = with pkgs; [
    virt-manager
    virt-viewer
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];

  home.activation.createVirtDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ${homedir}/VirtualMachines/ISOs
    mkdir -p ${homedir}/VirtualMachines/Shared
  '';

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };

    "org/virt-manager/virt-manager" = {
      xmleditor-enabled = true;
      system-tray = true;
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

    "org/virt-manager/virt-manager/console" = {
      scaling = 1;
      resize-guest = 1;
    };
  };
}
