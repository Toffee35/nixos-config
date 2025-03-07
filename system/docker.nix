{ username, ... }: {
  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    daemon.settings.data-root = "/mnt/Files/Docker";
  };

  users.extraGroups.docker.members = [ "${username}" ];
}
