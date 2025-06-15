{...}: {
  virtualisation.oci-containers = {
    backend = "docker";

    containers.portainer = {
      image = "portainer/portainer-ce:alpine";

      autoRemoveOnStop = false;
      autoStart = true;

      ports = [
        "9443:9443"
        "8000:8000"
      ];

      volumes = [
        "/run/user/1000/docker.sock:/var/run/docker.sock"
      ];

      extraOptions = [
        "--restart always"
      ];
    };
  };
}
