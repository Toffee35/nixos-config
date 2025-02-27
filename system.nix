{ modulesPath, stateVersion, ... }:
let
  modules = ./system;
  entries = builtins.readDir modules;
  topFiles = builtins.filter (name: builtins.match ".*\\.nix$" name != null)
    (builtins.attrNames entries);
  topFilesPaths = map (name: "${modules}/${name}") topFiles;
  defaultFiles = builtins.concatLists (map (name:
    if entries.${name}.isDirectory then
      let subEntries = builtins.readDir "${modules}/${name}";
      in if builtins.elem "default.nix" (builtins.attrNames subEntries) then
        [ "${modules}/${name}/default.nix" ]
      else
        [ ]
    else
      [ ]) (builtins.attrNames entries));
in {
  imports = topFilesPaths ++ defaultFiles
    ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = { inherit stateVersion; };
}
