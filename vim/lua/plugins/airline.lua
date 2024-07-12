return {
    'bling/vim-airline',
    config = function ()
        vim.g.airline_powerline_fonts = 1
        vim.g['airline#extensions#tabline#enabled'] = 1
        vim.g['airline#extensions#tabline#fnamemod'] = ':t'
    end,
}
