-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" })
config.font = wezterm.font("Cascadia Code NF")
config.enable_kitty_graphics = true
-- config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 15
config.line_height = 1.05

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.initial_rows = 42
config.initial_cols = 140

config.window_background_opacity = 0.95
config.macos_window_background_blur = 15

config.window_padding = {
  left = 18,
  right = 15,
  top = 20,
  bottom = 5,
}

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Nightfly (Gogh)"
-- config.color_scheme = "Monokai Soda"
-- config.color_scheme = "Sonokai (Gogh)"
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "rose-pine"
-- config.color_scheme = "nord"

-- config.colors = {
-- background = "#191927",
-- }

return config
