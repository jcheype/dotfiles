{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    neovim # or some other editor, e.g. nano or neovim
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
    unzip
    direnv
    gcc
    yarn
    nodePackages_latest.typescript-language-server
    tailwindcss-language-server
    biome
    zellij
    # Some common stuff that people expect to have
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.11";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";
  user.shell= "${pkgs.zsh}/bin/zsh";
}
