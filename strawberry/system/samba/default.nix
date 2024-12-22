{ userName, ... }: {
  services.samba = {
    enable = true;
    
    openFirewall = true;

    settings = {
      global = {
        security = "user";
      };

      shares."0N-Files" = {
        path = "/home/n/Files";
        browseable = "yes";
        writable = "yes";
        validUsers = [ "n" ];
      };
    };
  };
}
