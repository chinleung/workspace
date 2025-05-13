vim.keymap.set(
    'n',
    '<m-t>',
    function()
        require('codecompanion').toggle()
    end,
    { noremap = true, silent = true }
)

return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        strategies = {
            chat = {
                adapter = 'copilot',
            },
            cmd = {
                adapter = 'copilot',
            },
            inline = {
                adapter = 'copilot',
            },
        },
    },
}

