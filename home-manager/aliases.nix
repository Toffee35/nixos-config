{flakeDir, ...}: {
  home.shellAliases = {
    ll = "ls -la";
    cle = "clear";
    ".." = "cd ..";

    code = "codium";

    disk-id = "lsblk -o NAME,TYPE,SIZE,MOUNTPOINTS,UUID,PARTUUID";

    pkgs-search = "ls -la /nix/store | grep";
    pkgs-shell = "nix-shell -p";

    store-cle = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system && sudo nix-env --delete-generations old && sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix store optimise";

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
}
