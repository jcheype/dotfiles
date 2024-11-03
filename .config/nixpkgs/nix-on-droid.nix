{ config, lib, pkgs, ... }:

{

nixpkgs.config = {
packageOverrides = pkgs: {
unstable = import <nixpkgs-unstable> {
config = config.nixpkgs.config;
};
};
};

  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    gawk
    unstable.neovim # or some other editor, e.g. nano or neovim
    zsh
    zoxide
    stow
    starship
    eza
    bat
    git
    fzf
    fd
    gitui
    ripgrep
    openssh
    wget
    curl
    direnv
    gcc
    yarn
    tailwindcss-language-server
    biome
    zellij
    rustup
    # Some common stuff that people expect to have
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    unstable.jujutsu
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  #nix.extraOptions = ''
  #  experimental-features = nix-command flakes
  #'';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";

  # After installing home-manager channel like
  #   nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
  #   nix-channel --update
  # you can configure home-manager in here like
  #home-manager = {
  #  useGlobalPkgs = true;
  #
  #  config =
  #    { config, lib, pkgs, ... }:
  #    {
  #      # Read the changelog before changing this value
  #      home.stateVersion = "24.05";
  #
  #      # insert home-manager config
  #    };
  #};
user.shell= "${pkgs.zsh}/bin/zsh";
}

# vim: ft=nix
