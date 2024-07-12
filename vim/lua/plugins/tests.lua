return {
    'vim-test/vim-test',
    keys = {
        { '<leader>tf', ':w<cr>:TestFile<cr>' },
        { '<leader>tl', ':w<cr>:TestLast<cr>' },
        { '<leader>tn', ':w<cr>:TestNearest<cr>' },
        { '<leader>ts', ':w<cr>:TestSuite<cr>' },
        { '<c-o>', '<c-\\><c-n>', mode = 't' }
    },
    init = function ()
        vim.g['test#neovim#term_position'] = 'vert botright 81'
        vim.g['test#php#phpunit#executable'] = 'php artisan test'
        vim.g['test#strategy'] = 'neovim'
    end,
}
