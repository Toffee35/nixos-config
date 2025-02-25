{ stateVersion, ... }: {
  imports = map (file: import ./home/${file})
    (builtins.attrNames (builtins.readDir ./home));

  home = { inherit stateVersion; };
}
