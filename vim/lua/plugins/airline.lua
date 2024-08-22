return {
    'vim-airline/vim-airline',
    dependencies = {
        'vim-airline/vim-airline-themes',
    },
    lazy = false,
    config = function ()
        vim.g.airline_left_alt_sep = ''
        vim.g.airline_left_sep = ''
        vim.g.airline_powerline_fonts = 1
        vim.g.airline_right_alt_sep = ''
        vim.g.airline_right_sep = ''
        vim.g['airline#extensions#tabline#enabled'] = 1
        vim.g['airline#extensions#tabline#fnamemod'] = ':t'
        vim.g.airline_theme = 'base16_gruvbox_dark_medium'
    end,
}
