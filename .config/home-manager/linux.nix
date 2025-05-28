{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "julien";
  home.homeDirectory = "/home/julien";
  home.packages = [
    #inputs.wezterm.packages.${pkgs.system}.default
    # (pkgs.nerdfonts.override {
    #   fonts = [
    #     "JetBrainsMono"
    #     "FiraCode"
    #   ];
    # })

    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.wl-clipboard
    pkgs.steam-run
    # inputs.ghostty.packages.${pkgs.system}.default
    # inputs.nixvim-custom.packages.${pkgs.system}.default

  ];
  programs.kitty.settings.cursor_trail = 3;
  # fonts.packages = [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  fonts.fontconfig.enable = true;
}
