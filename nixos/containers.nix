{...}: {
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      portainer = {
        image = "portainer/portainer-ce:alpine";
        cmd = ["--no-ssl"];
        ports = [
          "9000:9000"
        ];
        volumes = [
          "/var/run/docker.sock:/var/run/docker.sock"
          "portainer_data:/data"
        ];
        extraOptions = ["--restart=always"];
      };
    };
  };
}
