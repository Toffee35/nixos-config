{ username, ... }: {
  users.users.${username} = {
    isNormalUser = true;
    group = username;
    extraGroups =
      [ "users" "wheel" "networkmanager" "input" "audio" "video" "docker" ];
  };

  users.groups.${username} = { };
}
