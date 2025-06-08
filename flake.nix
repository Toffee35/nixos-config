{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nur,
  }: let
    system = "x86_64-linux";

    hostname = "0NDesktop";
    username = "n";

    homedir = "/home/${username}";
    flakeDir = "${homedir}/nixos-config";

    nixList = import ./utils/nix-list.nix;

    configsArgs = {
      inherit
        system
        flakeDir
        hostname
        username
        homedir
        nixList
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
        overlays = [nur.overlays.default];
      };

      extraSpecialArgs = configsArgs;

      modules = [
        ./home-manager
      ];
    };
  };
}
