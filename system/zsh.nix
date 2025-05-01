{ flakedir, pkgs, ... }: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    shellAliases = {
      ll = "ls -la";
      ff = "fastfetch";
      ".." = "cd ..";
      cle = "clear";
      rbt = "reboot";
      pwr = "poweroff";
      code = "codium";
      py-venv = "python -m venv .venv";
      pip-freeze = "pip freeze > requirements.txt && deactivate";
      venv-act = "source .venv/bin/activate";

      update =
        "nix flake update --flake ${flakedir} && sudo nixos-rebuild switch --flake ${flakedir} && home-manager switch --flake ${flakedir}";
      rebuild-nix = "sudo nixos-rebuild switch --flake ${flakedir}";
      rebuild-home = "home-manager switch --flake ${flakedir}";
      rebuild-home-b = "home-manager switch -b backup --flake ${flakedir}";
      check = "nix flake check ${flakedir}";
    };

    ohMyZsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
