return {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    opts = {
        override_by_extension = {
            ['blade.php'] = {
                icon = '󰫐',
                name = 'Blade',
                color = '#bd3c32',
            }
        },
    },
}
