{ username, ... }: {
  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    daemon.settings.data-root = "/mnt/Files/Docker";
  };

  systemd.services.docker.bindsTo = [ "mnt-Files.mount" ];

  users.extraGroups.docker.members = [ "${username}" ];
}
