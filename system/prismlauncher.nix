{ pkgs, prismlauncher, ... }: {
  environment.systemPackages =
    [ prismlauncher.packages.${pkgs.system}.prismlauncher ];
}
