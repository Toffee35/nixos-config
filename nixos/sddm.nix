{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "sddm-astronaut-theme";
    greeter.qt6.packages = [ pkgs.qt6.qtmultimedia ];
  };

  environment.systemPackages = with pkgs; [sddm-astronaut];
}
