{
  description = "Tenseurevyeux system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, nixpkgs-unstable, ... }@inputs: let
    system = "x86_64-linux";
    homeStateVersion = "25.05";
    user = "tenseurevyeux";
    hostname = "nixos";
    stateVersion = "25.05";

    pkgs = nixpkgs.legacyPackages.${system};
    pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};

    makeSystem = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs stateVersion hostname user pkgsUnstable;
      };

      modules = [
        ./hosts/${hostname}/configuration.nix
      ];
    };
  in {
    nixosConfigurations.${hostname} = makeSystem;

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit inputs homeStateVersion user pkgsUnstable;
      };

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
