{
  nixList,
  pkgs,
  username,
  homedir,
  ...
}: {
  imports = nixList ./.;

  home = {
    inherit username;
    homeDirectory = homedir;

    stateVersion = "25.05";
  };

  programs = {
    git.enable = true;
    tmux.enable = true;
    btop.enable = true;
    alacritty.enable = true;
    lazydocker.enable = true;
  };

  services.blueman-applet.enable = true;
}
