{ ... }: {
  services.openssh = {
    enable = true;
    startAgent = true;
  };
}
