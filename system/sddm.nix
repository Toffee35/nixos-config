{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      kdePackages = super.kdePackages // {
        sddm = super.kdePackages.sddm.overrideAttrs (oldAttrs: {
          postInstall = (oldAttrs.postInstall or "") + ''
            mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
            cp -R ${
              pkgs.fetchFromGitHub {
                owner = "Keyitdev";
                repo = "sddm-astronaut-theme";
                branch = "master";
              }
            }/* $out/share/sddm/themes/sddm-astronaut-theme/
            sed -i 's/^ConfigFile.*/ConfigFile=Themes\/purple_leaves.conf/' $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
          '';
        });
      };
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "sddm-astronaut-theme";
  };
}
