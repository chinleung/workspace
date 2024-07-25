local telescope = require('telescope')

-- Show the available code actions with a custom prompt title
function show_coc_actions()
    telescope.extensions.coc.code_actions{
        prompt_title = 'Action',
    }
end

return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    requires = { 'nvim-lua/plenary.nvim' },
    dependencies = {
        'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
        { '<leader>/', '<cmd>Telescope find_files<cr>', desc = 'File search' },
        { '<leader>s', '<cmd>Telescope live_grep<cr>', desc = 'Search in files' },
        { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Show buffers' },
    },
    config = function ()
        local actions = require('telescope.actions')

        telescope.load_extension('coc')
        telescope.load_extension('ui-select')

        telescope.setup{
            defaults = {
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                    }
                },
            },
            pickers = {
                find_files = {
                    file_ignore_patterns = {
                        '^.git/',
                    },
                    hidden = true,
                    no_ignore = true,
                },
                live_grep = {
                    additional_args = function (opts)
                        return {
                            '--hidden',
                            '--no-ignore',
                        }
                    end,
                    glob_pattern = {
                        '!.env.example',
                        '!.git/',
                        '!composer.lock',
                        '!package-lock.json',
                    },
                }
            },
        }

        vim.api.nvim_set_keymap(
            'n',
            '<leader>a',
            ':lua show_coc_actions()<cr>',
            {
                noremap = true,
                silent = true,
            }
        )
    end,
}
