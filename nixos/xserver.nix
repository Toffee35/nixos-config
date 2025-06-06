{...}: {
  services.xserver = {
    enable = true;

    windowManager.bspwm.enable = true;

    dpi = 91;

    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };
  };
}
