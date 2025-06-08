{flakeDir, ...}: {
  home.shellAliases = {
    ll = "ls -lah";
    cle = "clear";
    ".." = "cd ..";

    code = "codium";
    lzdo = "lazydocker";

    fl-chk = "nix flake check";
    fl-up = "nix flake update --flake ${flakeDir}";
    fl-reb = "cle && fl-up && fl-chk && os-reb && hm-reb";
    fl-reb-f = "cle && fl-up && fl-chk && os-reb && hm-reb";

    nx-coll = "sudo nix-collect-garbage -d";
    nx-opt = "sudo nix store optimise";
    nx-del-gens = "sudo nix-env --delete-generations old";
    nx-gc = "sudo nix-store --gc";

    os-reb = "sudo nixos-rebuild switch --flake ${flakeDir}";
    os-reb-f = "os-reb --impure";
    hm-reb = "home-manager switch --flake ${flakeDir}";
    hm-reb-f = "hm-reb -b backup --impure";

    rbt = "reboot";
    pwr = "poweroff";
  };
}
