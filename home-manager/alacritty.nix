{...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = "0.8";
      font.size = "7.5";
    };
  };

  home.sessionVariables.TERMINAL = "alacritty";
}
