{ username, ... }: {
  programs.virt-manager.enable = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  virtualisation = {
    libvirtd.enable = true;

    spiceUSBRedirection.enable = true;
  };

  users.groups.libvirtd.members = [ "${username}" ];
}
