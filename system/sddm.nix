{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
  };
}
