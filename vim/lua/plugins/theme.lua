return {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000,
    config = function () 
        vim.cmd([[colorscheme gruvbox]])

        vim.cmd('hi CursorLineNr guibg=#282828 ctermbg=235')
        vim.cmd('hi NormalFloat guibg=#3c3836')
        vim.cmd('hi! SignColumn guibg=#282828 ctermbg=235')
        vim.cmd('hi TabLineFill guibg=#282828 ctermbg=235')
        vim.cmd('hi TabLineSel guibg=#282828 ctermfg=yellow')
    end,
}
