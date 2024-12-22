{ userName, hostName, ... }: {
  services = {
    samba = {
      enable = true;
      
      openFirewall = true;

      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "netbios name" = "${hostName}-Files";
          "server string" = "${hostName}-Files-Server";
          "security" = "user";
          "guest account" = "nobody";
          "map to guest" = "bad user";
        };

        "Files" = {
          "path" = "/home/${userName}/Files";
          "browseable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "${userName}";
        };
      };
    };

    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };
}
