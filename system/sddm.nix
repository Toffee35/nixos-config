{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      kdePackages = super.kdePackages // {
        sddm = super.kdePackages.sddm.overrideAttrs (oldAttrs: {
          postInstall = (oldAttrs.postInstall or "") + ''
            mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
            cp -R ${
              builtins.fetchGit {
                url = "https://github.com/Keyitdev/sddm-astronaut-theme.git";
                rev = "master";
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
