return {
    'allaman/emoji.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp',
        'nvim-telescope/telescope.nvim',
    },
    config = function (_, opts)
        require('emoji').setup({
            enable_cmp_integration = true,
        })

        local telescope = require('telescope').load_extension('emoji')

        vim.keymap.set(
            'n',
            '<leader>ep',
            telescope.emoji,
            { desc = '[S]earch [E]moji' }
        )
    end,
}
