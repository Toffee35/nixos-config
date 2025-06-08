{...}: {
  services.xserver = {
    enable = true;

    dpi = 90;

    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };
  };
}
