return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    opts = {
        cmdline = {
            format = {
                cmdline = {
                    title = ' Command ',
                },
                input = {
                    view = 'cmdline_input',
                    icon = '󰥻 ',
                },
                search_down = {
                    icon = ' ',
                },
                laravel = {
                    view = 'cmdline_input',
                    icon = '󰫐 ',
                    icon_hl_group = 'GruvboxRed',
                    pattern = 'valet php artisan',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = 'GruvboxRed',
                                FloatTitle = 'GruvboxRed',
                            }
                        },
                    },
                },
                terminal = {
                    view = 'cmdline_input',
                    icon = ' ',
                    pattern = '^:split | terminal',
                }
            },
        },
    },
}
