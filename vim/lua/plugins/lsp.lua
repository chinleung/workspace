return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
        local function on_attach(client, buffer)
            -- Configure the server capabilities
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.renameProvider = {
                prepareProvider = true
            }

            -- Set up keymaps
            local options = { buffer = buffer, noremap = true, silent = true }

            vim.keymap.set('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', options)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', options)
            vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>', options)
            vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>', options)
            vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', options)
            vim.keymap.set('n', 'gS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', options)
            vim.keymap.set('n', 'dl', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', options)
            vim.keymap.set('n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
            vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', options)
            vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', options)
        end

        vim.lsp.config('intelephense', {
            on_attach = on_attach,
        })

        vim.lsp.config('ts_ls', {
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
            init_options = {
                plugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vim.fn.stdpath("data") .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                        languages = { 'vue' },
                    },
                },
            },
            on_attach = on_attach,
        })

        vim.lsp.config('volar', {})

        -- Fix the diagnostics signs' styling
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '→',
                    [vim.diagnostic.severity.WARN]  = '→',
                    [vim.diagnostic.severity.INFO]  = '→',
                    [vim.diagnostic.severity.HINT]  = '→',
                },
            },
        })

        vim.cmd('hi DiagnosticSignError ctermbg=235 guibg=#282828 guifg=#fb4934')
        vim.cmd('hi DiagnosticSignWarn ctermbg=235 guibg=#282828 guifg=#fdba48')
        vim.cmd('hi DiagnosticSignInfo ctermbg=235 guibg=#282828 guifg=#8ec07c')
        vim.cmd('hi DiagnosticSignHint ctermbg=235 guibg=#282828 guifg=#82a498')
    end,
}
