{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.transmission_4-qt ];

  services.transmission.enable = true;
}
