{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
  };
}
