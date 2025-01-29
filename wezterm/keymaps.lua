return {
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
    },
    {
        key = 'Backspace',
        mods = 'OPT',
        action = wezterm.action.SendString("\x17"),
    },
    {
        key = 'Enter',
        mods = 'OPT',
        action = wezterm.action.SendString("\x1b\r"),
    },
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = wezterm.action.SendString("\x1bb"),
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendString("\x1bf"),
    },
    {
        key = 'UpArrow',
        mods = 'OPT',
        action = wezterm.action.SendString("\x1bp"),
    },
    {
        key = 'DownArrow',
        mods = 'OPT',
        action = wezterm.action.SendString("\x1bn"),
    },
}
