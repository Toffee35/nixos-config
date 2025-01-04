{ userName, ... }: {
  users.users.${userName} = {
    home = "/home/${userName}";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "audio"
      "video"
      "networkmanager"
      "docker"
    ];
  };
}
