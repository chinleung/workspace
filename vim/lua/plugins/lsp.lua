return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
        local lsp = require('lspconfig')

        local function on_attach(client, buffer)
            -- Configure the server capabilities
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.renameProvider = {
                prepareProvider = true
            }

            -- Set up keymaps
            local options = { noremap = true, silent = true }

            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gn', '<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gp', '<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'dl', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<cr>', options)
            vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<cr>', options)
        end

        lsp.intelephense.setup({
            on_attach = on_attach,
        })

        lsp.ts_ls.setup({
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

        lsp.volar.setup{}

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
