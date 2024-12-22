{ userName, ... }: {
  services.samba = {
    enable = true;
    securityType = "user";
    shares = {
      "0N-Files" = {
        path = "/home/${userName}/Files";
        browseable = true;
        writable = true;
        validUsers = [ userName ];
      };
    };
  };
}
