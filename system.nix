{ modulesPath, stateVersion, ... }: {
  imports = (map (file: import ./system/${file})
    (builtins.attrNames (builtins.readDir ./system)))
    ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = { inherit stateVersion; };
}
