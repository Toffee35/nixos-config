{ modulesPath, stateVersion, importList, pkgs, ... }: {
  imports = importList {
    dir = ./system;
    inherit pkgs;
  } ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = { inherit stateVersion; };
}
