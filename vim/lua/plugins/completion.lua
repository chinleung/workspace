return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
    },
    config = function ()
        local cmp = require('cmp')
        local lspkind = require('lspkind')

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
                ['<down>'] = cmp.mapping.select_next_item(),
                ['<cr>'] = cmp.mapping.confirm({
                    select = true,
                }),
                ['<up>'] = cmp.mapping.select_prev_item(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
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
