{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
  };
}
