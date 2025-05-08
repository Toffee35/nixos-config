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
      venv = "uv venv .venv";
      freeze = "uv pip freeze > requirements.txt";
      activate = "source .venv/bin/activate";
      install = "uv pip install -r requirements.txt";

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
