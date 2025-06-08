{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "sddm-astronaut-theme";
  };

  environment.systemPackages = [pkgs.sddm-astronaut];
}
