return {
    'tpope/vim-commentary',
    lazy = false,
    keys = {
        {
            '<leader>ct',
            ':Commentary<cr>',
            mode = { 'n', 'v' },
            { silent = true }
        },
    },
}
