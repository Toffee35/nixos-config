dir: let
  items = builtins.readDir dir;
  names = builtins.attrNames items;

  filesFilter = name:
    items.${name}
    == "regular"
    && builtins.match ".*\\.nix$" name != null
    && name != "default.nix";
  files = builtins.filter filesFilter names;

  dirsFilter = name: items.${name} == "directory";
  dirs = builtins.filter dirsFilter names;

  addPath = name: "${dir}/${name}";
  list = builtins.map addPath (files ++ dirs);
in
  list
