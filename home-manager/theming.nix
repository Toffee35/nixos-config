{pkgs, ...}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Quintom_Ink";
      package = pkgs.quintom-cursor-theme;
    };

    iconTheme = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-icon-theme;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-icon-theme;
    };
  };

  qt = {
    enable = true;

    platformTheme.name = "gtk";

    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
