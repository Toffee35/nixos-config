{ pkgs, ... }: {
  services.displayManager.sddm = { enable = true; };
  environment.systemPackages = [ pkgs.sddm-astronaut ];
}
