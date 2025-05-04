return {
    'stevearc/conform.nvim',
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
        formatters_by_ft = {
            php = { 'pint', 'php_cs_fixer' },
            vue = { 'prettier' },
        },
    },
}
