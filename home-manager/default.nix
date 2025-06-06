{
  nixVer,
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

    sessionVariables = {
      EDITOR = "code";
      BROWSER = "firefox";
      TERMINAL = "alacritty";

      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };

    stateVersion = nixVer;
  };

  programs = {
    git.enable = true;
    tmux.enable = true;
    btop.enable = true;
    alacritty.enable = true;
    lazydocker.enable = true;
  };
}
