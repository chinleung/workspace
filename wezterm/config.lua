local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local tab_bar_enabled = false

config.enable_tab_bar = tab_bar_enabled
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 18
config.line_height = 1.8

config.colors = {
    background = '#272727',
    cursor_bg = '#a59a86',
}

config.keys = require 'keymaps.lua'

config.window_padding = {
    bottom = 0,
    left = 0,
    right = 0,
    top = "5px",
}

return config
