vim.keymap.set(
    'n',
    '<m-t>',
    ':CodeCompanionActions<cr>',
    { noremap = true, silent = true }
)

return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'ravitemer/mcphub.nvim',
    },
    opts = {
        extensions = {
            mcphub = {
                callback = 'mcphub.extensions.codecompanion',
                opts = {
                    make_tools = true,
                    show_server_tools_in_chat = true,
                    add_mcp_prefix_to_tool_names = false,
                    show_result_in_chat = true,
                    format_tool = nil,
                    make_vars = true,
                    make_slash_commands = true,
                },
            },
        },
        strategies = {
            chat = {
                adapter = 'copilot',
            },
            cmd = {
                adapter = 'copilot',
            },
            inline = {
                adapter = 'copilot',
            },
        },
    },
}

