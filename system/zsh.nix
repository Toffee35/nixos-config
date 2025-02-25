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

      rebuild = "sudo nixos-rebuild switch --flake ${flakedir}";
      rebuild-with-update =
        "nix flake update --flake ${flakedir}; sudo nixos-rebuild switch --flake ${flakedir}";
    };
    histSize = 10000;

    ohMyZsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
