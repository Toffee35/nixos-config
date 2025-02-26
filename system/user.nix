{ username, ... }: {
  users.users.${username} = {
    isNormalUser = true;
    group = username;
    extraGroups =
      [ "wheel" "networkmanager" "input" "audio" "video" "libvirtd" ];
  };

  users.groups.${username} = { };
}
