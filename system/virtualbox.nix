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

  boot.blacklistedKernelModules = [ "kvm-intel" "kvm-amd" ];

  users.extraGroups.vboxusers.members = [ "${username}" ];
}
