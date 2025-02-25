{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ nixfmt-classic vscodium ];
  programs.direnv.enable = true;
}
