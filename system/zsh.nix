{ flakedir, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -la";
      ff = "fastfetch";
      ".." = "cd ..";
      cle = "clear";
      rbt = "reboot";
      pwr = "poweroff";
      code = "codium";

      update = ''
        nix flake update --flake ${flakedir} &&
        sudo nixos-rebuild switch --flake ${flakedir} &&
        home-manager switch --flake ${flakedir}
      '';
      rebuild-nix = "sudo nixos-rebuild switch --flake ${flakedir}";
      rebuild-home = "home-manager switch --flake ${flakedir}";
      rebuild-home-b = "home-manager switch -b backup --flake ${flakedir}";
      check = "nix flake check ${flakedir}";
    };
    histSize = 10000;

    ohMyZsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
