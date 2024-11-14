{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    homeConfigurations = {
            "julien" = home-manager.lib.homeManagerConfiguration {
                # Note: I am sure this could be done better with flake-utils or something
                pkgs = import nixpkgs { system = "x86_64-linux"; };

                modules = [ ./home.nix ]; # Defined later
            };
        };
  };
}
