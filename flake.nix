{
  description = "My NixOs Configurations For Desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }:
  let
    hardware = /etc/nixos/hardware-configuration.nix;

    hostName = "0N";
    userName = "n";

    systemVersion = "25.05";
    homeVersion = "25.05";

    timeZone = "Turkey";

    system = "x86_64-linux";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.strawberry = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit hostName userName systemVersion timeZone pkgs-stable;
      };

      modules = [
        ./strawberry/packages
        ./strawberry/system

        hardware
      ];
    };

    homeConfigurations.strawberry = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit userName homeVersion pkgs-stable;
      };

      pkgs = nixpkgs.legacyPackages.${system};
      
      modules = [
        ./strawberry/home.nix
      ];
    };



    nixosConfigurations.blueberry = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit hostName userName systemVersion timeZone pkgs-stable;
      };

      modules = [
        ./blueberry

        hardware
      ];
    };

    homeConfigurations.blueberry = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit userName homeVersion pkgs-stable;
      };

      pkgs = nixpkgs.legacyPackages.${system};
      
      modules = [
        ./blueberry/home.nix
      ];
    };
  };
}
