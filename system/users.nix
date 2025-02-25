{ username, ... }: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" "audio" "video" ];
  };
}
