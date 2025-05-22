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

  outputs = { self, nixpkgs, catppuccin, ... }@inputs: {
    nixpkgs.config = {
      allowUnfree = true;
    };
# use "nixos", or your hostname as the name of the configuration
# it's a better practice than "default" shown in the video
    nixosConfigurations.minibook = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/minibookx/configuration.nix
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
# if you use home-manager
            home-manager.users.julien = {

              imports = [
                ../.config/home-manager/linux.nix
                ../.config/home-manager/home.nix
                catppuccin.homeModules.catppuccin
              ];
              catppuccin.flavor = "mocha";
              catppuccin.enable = true;


gtk.theme = {
  name = "catppuccin-mocha-blue-compact+default";
  package =
    (nixpkgs.catppuccin-gtk.overrideAttrs {
      src = nixpkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "gtk";
        rev = "v1.0.3";
        fetchSubmodules = true;
        hash = "sha256-q5/VcFsm3vNEw55zq/vcM11eo456SYE5TQA3g2VQjGc=";
      };

      postUnpack = "";
    }).override
      {
        accents = [ "blue" ];
        variant = "mocha";
        size = "compact";
      };
};



            };
          }
      ];
    };
  };
}
