{ pkgs, ... }: {
  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.quintom-cursor-theme;
      name = "Quintom_Ink";
      size = 24;
    };

    iconTheme = {
      package = pkgs.colloid-icon-theme;
      name = "Colloid-Dark";
    };

    theme = {
      package = pkgs.fluent-gtk-theme;
      name = "Fluent-Dark";
    };
  };
}
