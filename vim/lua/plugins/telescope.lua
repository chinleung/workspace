return {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>/', '<cmd>Telescope find_files<cr>', desc = 'File search' },
        { '<leader>s', '<cmd>Telescope live_grep<cr>', desc = 'Search in files' },
        { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Show buffers' },
    },
    config = function ()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.load_extension('coc')

        telescope.setup{
            defaults = {
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                    }
                }
            }
        }
    end,
}
