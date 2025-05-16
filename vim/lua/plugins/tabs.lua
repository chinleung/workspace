return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        highlights = {
            background = {
                bg = '#282828',
            },
            buffer_selected = {
                bg = '#282828',
                fg = '#fabd2f',
                italic = false,
            },
            error = {
                bg = '#282828',
                fg = '#fb4934',
            },
            error_diagnostic = {
                bg = '#282828',
                fg = '#fb4934',
            },
            error_selected = {
                bg = '#282828',
                fg = '#fabd2f',
                italic = false,
            },
            fill = {
                bg = '#282828',
            },
            hint = {
                bg = '#282828',
                fg = '#83a598',
            },
            hint_diagnostic = {
                bg = '#282828',
                fg = '#83a598',
            },
            indicator_selected = {
                fg = '#282828',
                bg = '#282828',
            },
            modified = {
                bg = '#282828',
            },
            separator = {
                fg = '#282828',
                bg = '#282828',
            },
        },
        options = {
            always_show_bufferline = true,
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "

                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                        or (e == "warning" and " " or " ")

                    s = s .. n .. sym
                end

                return s
            end,
            enforce_regular_tabs = true,
            mode = 'buffers',
            separator_style = 'thin',
            show_buffer_close_icons = false,
        },
    },
}
