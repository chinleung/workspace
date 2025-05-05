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
            fill = {
                bg = '#282828',
            },
            indicator_selected = {
                fg = '#282828',
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
            mode = 'buffers',
            separator_style = 'thin',
            show_buffer_close_icons = false,
        },
    },
}
