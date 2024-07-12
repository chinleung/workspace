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
            },
        },
    },
}
