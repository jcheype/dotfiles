{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
   home.username = "julien";
   home.homeDirectory = "/home/julien";
   home.packages = [
    #inputs.wezterm.packages.${pkgs.system}.default
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.wl-clipboard
    inputs.ghostty.packages.${pkgs.system}.default

   ];
  fonts.fontconfig.enable = true;
}
