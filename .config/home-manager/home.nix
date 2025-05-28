{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # home.username = "julien";
  # home.homeDirectory = "/home/julien";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs; [
    neovim
    git
    jujutsu
    zsh
    zoxide
    stow
    ripgrep
    starship
    fzf
    eza
    bat
    fd
    tmux
    lazydocker
    nixd
    btop
    yazi
    atuin
    pik

    k9s
    azure-cli
    kubelogin
    kubectx
    kubectl

    gcc
    gnumake

    lua-language-server
    typescript-language-server
    vscode-langservers-extracted

    nixpkgs-fmt
    nixd

    nodejs

    google-chrome
    vscode
  ];

  imports = [
    ./neovim
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/julien/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

  };
  # programs.nvf = {
  #   enable = false;
  #   # your settings need to go into the settings attribute set
  #   # most settings are documented in the appendix
  #   settings = {
  #     vim = {
  #       binds.whichKey.enable = true;
  #       lsp = {
  #         enable = true;
  #         formatOnSave = true;
  #       };
  #       languages = {
  #         enableFormat = true;
  #         enableTreesitter = true;
  #         html.enable = true;
  #         lua.enable = true;
  #         nix.enable = true;
  #         python.enable = true;
  #         rust.enable = true;
  #         ts.enable = true;
  #         ts.format.type = "biome";
  #       };
  #       vimAlias = true;
  #       theme = {
  #         enable = true;
  #         name = "gruvbox";
  #         style = "dark";
  #       };
  #       statusline.lualine.enable = true;
  #       telescope = {
  #         enable = true;
  #         mappings = {
  #           findFiles = lib.nvim.bind.smkMappingOption "Find files [Telescope]" "<leader> ";
  #           # liveGrep = mkMappingOption "Live grep [Telescope]" "<leader>sg";
  #         };
  #       };
  #
  #       autocomplete.blink-cmp.enable = true;
  #       mini = {
  #         ai.enable = true;
  #         basics.enable = true;
  #         pairs.enable = true;
  #         surround.enable = true;
  #       };
  #       utility.oil-nvim.enable = true;
  #       keymaps = [
  #         {
  #           key = "-";
  #           mode = [ "n" ];
  #           action = ":Oil<CR>";
  #           silent = true;
  #           desc = "Goto Oil";
  #         }
  #
  #       ];
  #     };
  #   };
  # };
}
