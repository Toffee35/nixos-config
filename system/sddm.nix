{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "sddm-astronaut-theme";
  };
}
