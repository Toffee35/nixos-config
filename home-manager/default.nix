{
  nixList,
  pkgs,
  username,
  homedir,
  lib,
  ...
}: {
  imports = nixList ./.;

  home = {
    inherit username;
    homeDirectory = homedir;

    enableNixpkgsReleaseCheck = false;

    stateVersion = "25.05";
  };

  programs = {
    git.enable = true;
    tmux.enable = true;
    btop.enable = true;
    alacritty.enable = true;
    lazydocker.enable = true;
  };
}
