{ pkgs, astronaut, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      kdePackages = super.kdePackages // {
        sddm = super.kdePackages.sddm.overrideAttrs (oldAttrs: {
          postInstall = (oldAttrs.postInstall or "") + ''
            mkdir -p $out/share/sddm/themes/astronaut
            cp -R ${
              pkgs.fetchFromGitHub {
                owner = "Keyitdev";
                repo = "sddm-astronaut-theme";
                rev = "5e39e0841d4942757079779b4f0087f921288af6";
                sha256 = "09vi9dr0n0bhq8cj4jq1h17jw2ssi79zi9lhn0j6kgbxrqk2g8vf";
              }
            }/* $out/share/sddm/themes/astronaut/
            sed -i 's/^ConfigFile.*/ConfigFile=Themes\/purple_leaves.conf/' $out/share/sddm/themes/astronaut/metadata.desktop
          '';
        });
      };
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "astronaut";
  };
}
