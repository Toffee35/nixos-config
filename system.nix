{ modulesPath, stateVersion, ... }:
let
  modulesDir = ./system;
  entries = builtins.readDir modulesDir;
  modulePaths = builtins.filter (path: path != null) (map (name:
    let
      entry = entries.${name};
      fullPath = "${modulesDir}/${name}";
    in if entry.type == "regular" then
      if builtins.match ".*\\.nix$" name != null then fullPath else null
    else if entry.type == "directory" then
      if builtins.pathExists (fullPath + "/default.nix") then
        fullPath + "/default.nix"
      else
        null
    else
      null) (builtins.attrNames entries));
in {
  imports = modulePaths
    ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = { inherit stateVersion; };
}
