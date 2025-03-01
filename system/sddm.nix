{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      kdePackages = super.kdePackages // {
        sddm = super.kdePackages.sddm.overrideAttrs (oldAttrs: {
          installPhase = ''
            ${oldAttrs.installPhase}
            mkdir -p $out/share/sddm/themes/my-astronaut
            cp -R ${builtins.fetchGit {
              url = "https://github.com/Keyitdev/sddm-astronaut-theme.git";
            }}/* $out/share/sddm/themes/my-astronaut/
            sed -i 's/^ConfigFile.*/ConfigFile=Themes\/purple_leaves.conf/' $out/share/sddm/themes/my-astronaut/metadata.desktop
          '';
        })
      };
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.plasma5Packages.sddm;
    theme = "my-astronaut";
  };
}
