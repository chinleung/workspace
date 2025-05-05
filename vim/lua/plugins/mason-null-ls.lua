return {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'nvimtools/none-ls.nvim',
    },
    opts = {
        ensure_installed = {
            'prettier',
        },
        automatic_installation = true,
    },
}
