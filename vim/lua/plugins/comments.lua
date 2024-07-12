return {
    'tpope/vim-commentary',
    lazy = false,
    keys = {
        { '<leader>cc', ':Commentary<cr>', mode = { 'i', 'v' }, { silent = true } },
    },
}
