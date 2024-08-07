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
                        ['<cr>'] = function (buffer)
                            local actions = require('telescope.actions')
                            local state = require('telescope.actions.state')
                            local picker = state.get_current_picker(buffer)
                            local selections = picker:get_multi_selection()

                            if vim.tbl_isempty(selections) then
                                actions.select_default(buffer)
                            else
                                actions.close(buffer)

                                for _, entry in pairs(selections) do
                                    if entry.path ~= nil then
                                        vim.cmd(string.format('edit %s', entry.path))
                                    end
                                end
                            end
                        end
                    }
                },
            },
            pickers = {
                find_files = {
                    file_ignore_patterns = {
                        '^.git/',
                        '^.phpunit.result.cache',
                        '^public/build/',
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
