{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats = {
      url = "github:BirdeeHub/nixCats-nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      ...
    }@inputs:
    {
      nixpkgs.config = {
        allowUnfree = true;
      };
      # use "nixos", or your hostname as the name of the configuration
      # it's a better practice than "default" shown in the video
      nixosConfigurations.minibook = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/minibookx/configuration.nix
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.julien = {

              imports = [
                nvf.homeManagerModules.default # <- this imports the home-manager module that provides the options
                ../.config/home-manager/linux.nix
                ../.config/home-manager/home.nix
              ];
            };
          }
        ];
      };

      nixosConfigurations.x1carbon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/x1carbon/configuration.nix
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.julien = {

              imports = [
                nvf.homeManagerModules.default # <- this imports the home-manager module that provides the options
                ../.config/home-manager/linux.nix
                ../.config/home-manager/home.nix
              ];
            };
          }
        ];
      };

    };
}
