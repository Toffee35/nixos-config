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

      code = "codium";

      disk-id = "lsblk -o NAME,TYPE,SIZE,MOUNTPOINTS,UUID,PARTUUID";

      pkgs-search = "ls -la /nix/store | grep";
      pkgs-shell = "nix-shell -p";

      store-chck = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system && sudo nix-env --delete-generations old && sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix store optimise";

      flk-up = "nix flake update --flake ${flakeDir}";

      rbld-os = "sudo nixos-rebuild switch --flake ${flakeDir}";
      rbld-os-f = "rbld-os --impure";

      rbld-home = "home-manager switch --flake ${flakeDir}";
      rbld-home-f = "rbld-home -b backup --impure";

      os-update = "cle && flk-up && rbld-os && rbld-home";
      os-update-f = "cle && flk-up && rbld-os-f && rbld-home-f";

      rbt = "reboot";
      pwr = "poweroff";
    };

    histSize = 10000;
  };
}
