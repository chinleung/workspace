return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
    },
    config = function ()
        local cmp = require('cmp')
        local lspkind = require('lspkind')

        cmp.register_source('uuid', require('sources.uuid'))

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    symbol_map = {
                        Function = 'ƒ',
                        Method = 'ƒ',
                    },
                }),
            },
            mapping = {
                ['<cr>'] = cmp.mapping.confirm({
                    select = true,
                }),
                ['<down>'] = cmp.mapping.select_next_item(),
                ['<s-tab>'] = cmp.mapping.select_prev_item(),
                ['<tab>'] = cmp.mapping.select_next_item(),
                ['<up>'] = cmp.mapping.select_prev_item(),
            },
            snippet = {
                expand = function (args)
                    vim.snippet.expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'snippets' },
                { name = 'emoji' },
                { name = 'uuid', priority = 100 },
            })
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' },
            })
        })
    end,
}
