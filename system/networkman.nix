{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.networkmanager-openvpn ];
  networking.networkmanager.enable = true;
}
