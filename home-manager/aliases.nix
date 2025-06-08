{flakeDir, ...}: {
  home.shellAliases = {
    ll = "ls -la";
    cle = "clear";
    ".." = "cd ..";

    code = "codium";
    lzdo = "lazydocker";

    fl-chk = "nix flake check --flake ${flakeDir}";
    fl-up = "nix flake update --flake ${flakeDir}";
    fl-reb = "cle && fl-up && fl-check && os-reb && home-reb";
    fl-reb-f = "cle && fl-up && fl-check && os-reb && home-reb";

    nx-coll = "sudo nix-collect-garbage -d";
    nx-opt = "sudo nix store optimise";
    nx-del-gens = "sudo nix-env --delete-generations old";
    nx-gc = "sudo nix-store --gc";

    os-reb = "sudo nixos-rebuild switch --flake ${flakeDir}";
    os-reb-f = "os-reb --impure";
    hm-reb = "home-manager switch --flake ${flakeDir}";
    hm-reb-f = "home-reb -b backup --impure";

    rbt = "reboot";
    pwr = "poweroff";
  };
}
