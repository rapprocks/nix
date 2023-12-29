{
  description = "Multihost flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  
    nur.url = "github:nix-community/nur";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self
    , nixpkgs
    , home-manager
    , darwin
    , nur
    , firefox-addons
    , nixvim
    , ... 
    } @inputs:
    let
      pkgs = import nixpkgs {
        config.allowUnfree = true;
      };
      inherit (nixpkgs) lib;
    in    
    {
    nixosConfigurations = {
      "nixdesk" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixdesk
	  ./modules/common-linux.nix

          { nixpkgs.overlays = [ nur.overlay ]; }
	
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;

            home-manager.users.philip = { pkgs, ... }: {
              imports = [
                ./hosts/nixdesk/home.nix
                nixvim.homeManagerModules.nixvim
              ];
              home.username = "philip";
              home.homeDirectory = "/home/philip";
              home.stateVersion = "23.05";
            };
          }

        ];
      };
      "nixnuc" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixnuc
	  ./modules/common-linux.nix

          { nixpkgs.overlays = [ nur.overlay ]; }
	  
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;

            home-manager.users.philip = { pkgs, ... }: {
              imports = [./hosts/nixnuc/home.nix];
              home.username = "philip";
              home.homeDirectory = "/home/philip";
              home.stateVersion = "23.05";
            };
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
