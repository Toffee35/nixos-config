{ pkgs, ... }: {
  environment.systemPackages = [
    (
      import (
        builtins.fetchTarball "https://github.com/Diegiwg/PrismLauncher-Cracked/archive/develop.tar.gz"
      )
    ).packages.${pkgs.system}.prismlauncher
  ];
}
