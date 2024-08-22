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
                    title = 'Command',
                    icon_hl_group = 'GruvboxBlue',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = 'GruvboxBlue',
                                FloatTitle = 'GruvboxBlue',
                            }
                        },
                    },
                },
                git = {
                    view = 'cmdline_input',
                    icon = '󰊢 ',
                    icon_hl_group = 'GruvboxGreen',
                    pattern = 'Git',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = 'GruvboxGreen',
                                FloatTitle = 'GruvboxGreen',
                            }
                        },
                    },
                },
                input = {
                    view = 'cmdline_input',
                    icon = '󰥻 ',
                    icon_hl_group = 'GruvboxBlue',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = 'GruvboxBlue',
                                FloatTitle = 'GruvboxBlue',
                            }
                        },
                    }
                },
                search_down = {
                    icon = ' ',
                    icon_hl_group = 'GruvboxYellow',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = 'GruvboxYellow',
                                FloatTitle = 'GruvboxYellow',
                            }
                        },
                    }
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
                    icon_hl_group = 'GruvboxAqua',
                    pattern = '^:split | terminal',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = 'GruvboxAqua',
                                FloatTitle = 'GruvboxAqua',
                            }
                        },
                    },
                }
            },
        },
    },
}
