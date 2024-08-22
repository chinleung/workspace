return {
    'tpope/vim-fugitive',
    lazy = false,
    config = function ()
        vim.cmd('hi DiffAdd guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=142 cterm=NONE gui=NONE')
        vim.cmd('hi DiffChange guibg=#282828 ctermbg=235 guifg=#fdba48 ctermfg=108 cterm=NONE gui=NONE')
        vim.cmd('hi DiffDelete guibg=#282828 ctermbg=235 guifg=#fb4934 ctermfg=167 cterm=NONE gui=NONE')
    end,
    keys = {
        { "<leader>ga", ":Git commit --amend --reset-author<cr>", { silent = true } },
        { "<leader>gc", ":Git commit<cr>", { silent = true } },
        { "<leader>gd", ":Git diff<cr>", { silent = true } },
        { "<leader>gg", ":Git push<cr>", { silent = true } },
        { "<leader>gp", ":Git pull<cr>", { silent = true } },
        { "<leader>gs", ":Git<cr>", { silent = true } },
        { "<leader>gw", ":Gwrite<cr>", { silent = true } },
    },
}
