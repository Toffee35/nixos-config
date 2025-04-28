{ dir, pkgs }:
let
  items = builtins.readDir dir;
  names = builtins.attrNames items;

  filter = name: pkgs.lib.strings.hasSuffix ".nix" name;
  filtered = builtins.filter filter names;

  addPath = name: "${dir}/${name}";
  list = builtins.map addPath filtered;
in list
