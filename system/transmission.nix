{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.transmission_4-gtk ];

  services.transmission.enable = true;
}
