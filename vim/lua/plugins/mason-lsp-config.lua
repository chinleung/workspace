return {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    dependencies = {
        'williamboman/mason.nvim',
    },
    opts = {
        ensure_installed = {
            'intelephense',
            'vue-language-server',
        },
        automatic_installation = true,
    },
}
