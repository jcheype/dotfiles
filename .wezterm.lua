local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.enable_wayland = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = '2px',
  right = '2px',
  top = '0px',
  bottom = '0px',
}
return config

