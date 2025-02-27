{ modulesPath, stateVersion, ... }:
let
  dir = ./system;
  items = builtins.readDir dir;
  process = name: type:
    if type == "regular" then
      "${toString dir}/${name}"
    else if type == "directory" then
      "${toString dir}/${name}/abc"
    else
      null;
  modules = builtins.attrValues (builtins.mapAttrs process items);
  list = builtins.filter (x: x != null) modules;
in {
  imports = list ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = { inherit stateVersion; };
}
