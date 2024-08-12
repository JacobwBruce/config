-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Propo")
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.initial_rows = 42
config.initial_cols = 140

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.color_scheme = "Catppuccin Mocha"

return config
