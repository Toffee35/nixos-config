{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    dpi = 92;
    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };
  };
}
