{ username, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ wireguard-tools ];

  networking.networkmanager.enable = true;

  users.extraGroups.networkmanager.members = [ "${username}" ];
}
