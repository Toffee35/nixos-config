{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    firefox-addons,
  }: let
    system = "x86_64-linux";
    nixVer = "25.05";

    hostname = "0NDesktop";
    username = "n";

    homedir = "/home/${username}";
    flakeDir = "${homedir}/nixos-config";

    nixList = import ./utils/nix-list.nix;

    configsArgs = {
      inherit
        nixVer
        system
        flakeDir
        hostname
        username
        homedir
        nixList
        firefox-addons
        ;
    };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = configsArgs;

      modules = [
        ./nixos
      ];
    };

    homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;

        config.allowUnfree = true;
      };

      extraSpecialArgs = configsArgs;

      modules = [
        ./home-manager
      ];
    };
  };
}
