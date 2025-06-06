{flakeDir, ...}: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestions = {
      enable = true;
      strategy = [
        "history"
        "completion"
        "match_prev_cmd"
      ];
    };
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      cle = "clear";

      disk-id = "lsblk -o NAME,TYPE,SIZE,MOUNTPOINTS,UUID,PARTUUID";

      pkgs-search = "ls -la /nix/store | grep";
      pkgs-shell = "nix-shell -p";

      flk-up = "nix flake update --flake ${flakeDir}";
      rbld-os = "sudo nixos-rebuild switch --flake ${flakeDir}";
      rbld-home = "home-manager switch --flake ${flakeDir}";
      rbld-home-b = "home-manager switch --flake ${flakeDir} -b backup";

      os-update = "cle && flk-up && rbld-os && rbld-home-b && rbt";

      rbt = "reboot";
      pwr = "poweroff";
    };

    histSize = 10000;
  };
}
