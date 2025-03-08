{ username, ... }: {
  users.users.${username} = {
    isNormalUser = true;
    group = username;
    extraGroups = [ "users" "wheel" "input" "audio" "video" ];
  };

  users.groups.${username} = { };
}
