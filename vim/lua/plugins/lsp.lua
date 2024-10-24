return {
    'neovim/nvim-lspconfig',
    config = function ()
        local lsp = require('lspconfig')

        lsp.intelephense.setup({
            on_attach = function (client, buffer)
                -- Disable formatting
                client.server_capabilities.documentFormattingProvider = false

                -- Set up keymaps
                local options = { noremap = true, silent = true }

                vim.api.nvim_buf_set_keymap(buffer, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', 'gn', '<cmd>lua vim.diagnostic.goto_next({ float = false })<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', 'gp', '<cmd>lua vim.diagnostic.goto_prev({ float = false })<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<cr>', options)
                vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<cr>', options)
            end
        })

        -- Fix the diagnostics signs' styling
        vim.fn.sign_define('DiagnosticSignError', { text = '→', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('DiagnosticSignWarn',  { text = '→', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('DiagnosticSignHint',  { text = '→', texthl = 'DiagnosticSignHint' })
        vim.cmd('hi DiagnosticSignError ctermbg=235 guibg=#282828 guifg=#fb4934')
        vim.cmd('hi DiagnosticSignWarn ctermbg=235 guibg=#282828 guifg=#fdba48')
        vim.cmd('hi DiagnosticSignInfo ctermbg=235 guibg=#282828 guifg=#8ec07c')
        vim.cmd('hi DiagnosticSignHint ctermbg=235 guibg=#282828 guifg=#82a498')
    end,
}