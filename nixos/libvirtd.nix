{
  username,
  pkgs,
  ...
}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [username];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    qemu.vhostUserPackages = with pkgs; [virtiofsd];
  };
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}
