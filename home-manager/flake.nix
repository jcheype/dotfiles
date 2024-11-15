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
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    homeConfigurations = {
            "julien@Juliens-MacBook-Pro.local" = home-manager.lib.homeManagerConfiguration {
                # Note: I am sure this could be done better with flake-utils or something
                pkgs = import nixpkgs { system =  "aarch64-darwin"; };

                modules = [
                  ./darwin.nix
                  ./home.nix
                ]; # Defined later
            };
            "julien" = home-manager.lib.homeManagerConfiguration {
                # Note: I am sure this could be done better with flake-utils or something
                pkgs = import nixpkgs { system = "x86_64-linux"; };

                modules = [
                  ./linux.nix
                  ./home.nix
                ]; # Defined later
            };
        };
  };
}
