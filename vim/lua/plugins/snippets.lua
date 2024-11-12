return {
    'garymjr/nvim-snippets',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    opts = {
        create_cmp_source = true,
    },
    keys = {
        {
            '<c-j>',
            function()
                if vim.snippet.active({ direction = 1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                    return
                end
                return '<Tab>'
            end,
            expr = true,
            silent = true,
            mode = 'i',
        },
        {
            '<c-j>',
            function()
                vim.schedule(function()
                    vim.snippet.jump(1)
                end)
            end,
            expr = true,
            silent = true,
            mode = 's',
        },
        {
            '<c-k>',
            function()
                if vim.snippet.active({ direction = -1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(-1)
                    end)
                    return
                end
                return '<S-Tab>'
            end,
            expr = true,
            silent = true,
            mode = { 'i', 's' },
        },
    },
}
