{ ... }: {
  networking.networkmanager.enable = true;

  users.extraGroups.networkmanager.members = [ "${username}" ];
}
