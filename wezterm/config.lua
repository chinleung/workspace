local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local tab_bar_enabled = false

config.colors = {
    background = '#272727',
    cursor_bg = '#a59a86',
}

config.keys = {
    {
        key = 'd',
        mods = 'SUPER',
        action = wezterm.action.SplitHorizontal({
            domain = 'CurrentPaneDomain',
        })
    },
    {
        key = 'h',
        mods = 'SUPER',
        action = wezterm.action_callback(function (win, pane)
            local process = pane:get_foreground_process_name()

            if process == '/bin/zsh' then
                win:perform_action(wezterm.action.SendString("cd\n"), pane)
            end
        end),
    },
    {
        key = 'p',
        mods = 'SUPER',
        action = wezterm.action_callback(function (win, pane)
            local process = pane:get_foreground_process_name()

            if process == '/bin/zsh' then
                win:perform_action(wezterm.action.SendString("cd ~/Projects\n"), pane)
            end
        end),
    },
    {
        key = 't',
        mods = 'SUPER|SHIFT',
        action = wezterm.action_callback(function (win, panse)
            tab_bar_enabled = not tab_bar_enabled

            win:set_config_overrides({
                enable_tab_bar = tab_bar_enabled,
            })
        end),
    },
    {
        key = 'w',
        mods = 'SUPER',
        action = wezterm.action.CloseCurrentPane({
            confirm = true
        }),
    }
}

config.enable_tab_bar = tab_bar_enabled
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 18
config.line_height = 2

return config
