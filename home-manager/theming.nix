{pkgs, ...}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Quintom_Ink";
      package = pkgs.quintom-cursor-theme;
    };

    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };

    theme = {
      name = "Jasper-Dark-hdpi";
      package = pkgs.jasper-gtk-theme;
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
