{ username, ... }: {
  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    daemon.settings.data-root = "/mnt/Files/Docker";
  };

  systemd.services.docker = {
    requires = [ "mnt-Files.mount" ];
    after = [ "mnt-Files.mount" ];
    bindsTo = [ "mnt-Files.mount" ];
  };

  users.extraGroups.docker.members = [ "${username}" ];
}
