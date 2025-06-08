{
  username,
  pkgs,
  ...
}: {
  users.users.${username}.shell = pkgs.zsh;
}
