{
  username,
  pkgs,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [pkgs.OVMFFull.fd];
      };
    };
  };

  users.users.${username}.extraGroups = ["libvirtd" "kvm"];

  virtualisation.spiceUSBRedirection.enable = true;

  networking.bridges."br0".interfaces = [];
  networking.interfaces."br0".useDHCP = true;

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.bridge.bridge-nf-call-iptables" = 0;
  };

  boot.kernelModules = ["kvm-intel" "vfio-pci"];
}
