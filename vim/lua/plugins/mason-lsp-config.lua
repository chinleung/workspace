return {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    dependencies = {
        'williamboman/mason.nvim',
    },
    opts = {
        ensure_installed = {
            'intelephense',
            'tsserver',
            'volar',
        },
        automatic_installation = true,
    },
}
