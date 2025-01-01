{ pkgs, ... }: {
  environment.systemPackages = with pkgs.libsForQt5.qt5; [
    qtgraphicaleffects
    qtquickcontrols2
    qtsvg

    (import ./theming.nix { inherit pkgs; })
  ];

  services.displayManager = {
    defaultSession = "none+awesome";

    sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";

      settings.Theme = {
        CursorTheme = "Adwaita";
        Font = "Noto Sans";
      };
    };
  };
}
