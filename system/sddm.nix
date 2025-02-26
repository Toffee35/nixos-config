{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    theme = "${pkgs.sddm-astronaut}";
  };
}
