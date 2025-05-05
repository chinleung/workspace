return {
    'y3owk1n/undo-glow.nvim',
    version = '*',
    event = { 'VeryLazy' },
    opts = {
        animation = {
            enabled = true,
            duration = 500,
        },
        highglights = {
            undo = {
                hl_color = {
                    bg = '#48384B',
                },
            }
        }
    },
    config = function (_, options)
        local package = require('undo-glow')

        package.setup(options)

        vim.keymap.set('n', 'u', package.undo, { noremap = true, desc = 'Undo with highlight' })
        vim.keymap.set('n', '<c-r>', package.redo, { noremap = true, desc = 'Redo with highlight' })
        vim.keymap.set('n', 'p', package.paste_below, { noremap = true, desc = 'Paste below with highlight' })
        vim.keymap.set('n', 'P', package.paste_above, { noremap = true, desc = 'Paste above with highlight' })
        vim.keymap.set('n', 'n', package.search_next, { noremap = true, desc = 'Search next with highlight' })
        vim.keymap.set('n', 'N', package.search_prev, { noremap = true, desc = 'Search previous with highlight' })
        vim.keymap.set('n', '*', package.search_star, { noremap = true, desc = 'Search * with highlight' })

        vim.api.nvim_create_autocmd('TextYankPost', {
            desc = 'Highlight when yanking text',
            callback = require('undo-glow').yank,
        })
    end,
}
