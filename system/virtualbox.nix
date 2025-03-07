{ username, ... }: {
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };

    guest = {
      enable = true;
      dragAndDrop = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  users.extraGroups.vboxusers.members = [ ${username} ];
}
