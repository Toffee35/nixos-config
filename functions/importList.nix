{ dir, pkgs }:
let
  items = builtins.readDir dir;
  names = builtins.attrNames items2;
  filter = name: pkgs.lib.strings.hasSuffix ".nix" name;
  filtered = builtins.filter filter names;
in list
