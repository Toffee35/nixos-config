{ userName, hostName, ... }: {
  services = {
    samba = {
      enable = true;

      securityType = "user";
      openFirewall = true;

      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "netbios name" = "${hostName}-Files";
          "server string" = "${hostName}-Files-Server";
          "security" = "user";
          "map to guest" = "Bad User";
        };
        "Files" = {
          "path" = "/home/${userName}/Files";
          "valid users" = "${userName}";
          "read only" = "no";
          "browseable" = "yes";
          "create mask" = "0660";
          "directory mask" = "0770";
          "force user" = "${userName}";
          "force group" = "${userName}";
        };
      };
    };

    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };
}
