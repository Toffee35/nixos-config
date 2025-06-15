{...}: {
  virtualisation.oci-containers = {
    backend = "docker";

    containers.portainer = {
      image = "portainer/portainer-ce:alpine";

      ports = [
        "9443:9443"
        "8000:8000"
      ];

      volumes = [
        "/run/urs/1000/docker.sock:/var/run/docker.sock"
        "portainer_data:/data"
      ];

      extraOptions = [
        "--restart=always"
      ];
    };
  };
}
