{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = pkgs.sddm-astronaut;
  };
}
