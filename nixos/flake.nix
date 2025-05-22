{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    catppuccin.url = "github:catppuccin/nix";

  };

  outputs =
    {
      self,
      nixpkgs,
      catppuccin,
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
                ../.config/home-manager/linux.nix
                ../.config/home-manager/home.nix
                catppuccin.homeModules.catppuccin
              ];
              catppuccin.flavor = "mocha";
              catppuccin.enable = true;
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
                ../.config/home-manager/linux.nix
                ../.config/home-manager/home.nix
                catppuccin.homeModules.catppuccin
              ];
              catppuccin.flavor = "mocha";
              catppuccin.enable = true;
              gtk = {
                enable = true;
              };
            };
          }
        ];
      };

    };
}
