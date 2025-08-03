return {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    dependencies = {
        'williamboman/mason.nvim',
    },
    opts = {
        ensure_installed = {
            'intelephense',
            'ts_ls',
            'vue_ls',
        },
        automatic_enable = false,
        automatic_installation = true,
    },
}
