{ userName, ... }: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings.data-root = "/home/${userName}/Files/docker/";
  };
}
