return {
    'snacks.nvim',
    opts = function (_, opts)
        -- Add a key to start the Laravel builds
        table.insert(
            opts.dashboard.preset.keys,
            9,
            {
                icon = '󰫐',
                key = 'l',
                desc = 'Laravel',
                action = ':lua StartLaravel()'
            }
        )

        -- Overwrite the default key of Lazy
        opts.dashboard.preset.keys[10].key = 'L'
    end,
}
