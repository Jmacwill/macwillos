# flake.nix - Your main configuration entry point
{
  description = "My modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
#    qtgreet,
    ...
  } @ inputs: let
    # CONFIGURATION - Change these values for each machine!
    system = "x86_64-linux";

    # Define your machines here
    machines = {
      nixtop = {
        hostname = "nixtop";
        username = "jonathan";
        timezone = "America/Denver";
      };

      # Add more machines as needed
    };

    # Helper function to create a system configuration
    mkSystem = name: config:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          machineConfig = config;
        };
        modules = [
          # Hardware config specific to this machine
          ./hosts/${name}

          # Shared system configuration
          ./modules/system

          # Hyprland module
          hyprland.nixosModules.default

          # Home Manager integration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${config.username} = import ./modules/home;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              machineConfig = config;
            };
          }
        ];
      };
  in {
    # Generate configurations for all machines
    nixosConfigurations = builtins.mapAttrs mkSystem machines;
  };
}
