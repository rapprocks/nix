{
  description = "Multihost flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  
    nur.url = "github:nix-community/nur";
    
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, darwin, nur, ... }@inputs: {
    nixosConfigurations = {
      "nixnuc" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixnuc
	  ./modules/common-linux.nix
	  
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.philip = import ./hosts/nixnuc/home.nix;
          }

        ];
      };
      "nixwrk" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

	modules = [
          ./hosts/nixwrk
	  ./modules/common-linux.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.philip = import ./hosts/nixwrk/home.nix;


          }
	];
      };
    };
  };
}
