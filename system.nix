{ modulesPath, stateVersion, importList, ... }: {
  imports = (importList ./system)
    ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = { inherit stateVersion; };
}
