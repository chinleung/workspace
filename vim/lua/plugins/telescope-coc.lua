return {
    'fannheyward/telescope-coc.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    opts = {
        extensions = {
            coc = {
                prefer_locations = true,
                push_cursor_on_edit = true,
            },
        },
    },
    keys = {
        { '<space>a', ':Telescope coc code_actions<cr>', { noremap = true, nowait = true, silent = true } },
        { '<space>e', ':Telescope coc extensions<cr>', { noremap = true, nowait = true, silent = true } },
    },
}
