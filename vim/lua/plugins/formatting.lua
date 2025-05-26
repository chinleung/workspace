return {
    'stevearc/conform.nvim',
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
        formatters = {
            php_cs_fixer = {
                args = {
                    'fix',
                    '$FILENAME',
                    '--config='..vim.fn.expand('~/workspace/php/.php-cs-fixer.php')
                },
            },
        },
        formatters_by_ft = {
            php = { 'pint', 'php_cs_fixer', stop_after_first = true },
            vue = { 'prettier' },
        },
    },
}
