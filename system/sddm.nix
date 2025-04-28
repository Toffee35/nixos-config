{ pkgs, ... }: {
  environment.systemPackages =
    [ (pkgs.sddm-astronaut.override { embeddedTheme = "purple_leaves"; }) ];

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "sddm-astronaut-theme";
  };
}
