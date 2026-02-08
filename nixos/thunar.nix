{pkgs, ...}: {
  programs.thunar = {
    enable = true;

    plugins = with pkgs; [
      thunar-volman
    ];
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
