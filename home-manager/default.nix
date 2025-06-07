{
  nixList,
  username,
  homedir,
  pkgs,
  ...
}: {
  imports = nixList ./.;

  home = {
    inherit username;
    homeDirectory = homedir;

    enableNixpkgsReleaseCheck = false;

    packages = with pkgs; [
      telegram-desktop
    ];

    stateVersion = "25.11";
  };

  programs = {
    git.enable = true;
    tmux.enable = true;
    btop.enable = true;
    lazydocker.enable = true;
  };
}
