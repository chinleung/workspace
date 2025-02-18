return {
    'bassamsdata/namu.nvim',
    config = function()
        require('namu').setup({
            namu_symbols = {
                enable = true,
            },
        })

        vim.keymap.set('n', 'gs',':Namu symbols<cr>' , {
            desc = 'Jump to LSP symbol',
            silent = true,
        })
    end,
}
