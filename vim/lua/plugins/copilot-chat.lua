return {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim' },
    },
    keys = {
        {
            '<m-q>',
            desc = 'Quick chat',
            function ()
                local input = vim.fn.input('Quick chat: ')

                if input ~= '' then
                    require('CopilotChat').ask(input, {
                        selection = require('CopilotChat.select').buffers,
                    })
                end
            end,
        },
        {
            '<m-a>',
            function ()
                local actions = require('CopilotChat.actions')

                require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
            end,
        },
        {
            '<m-t>',
            ':CopilotChatToggle<cr>',
            desc = 'Toggle the chat',
        },
        {
            '<m-r>',
            ':CopilotChatReset<cr>',
            desc = 'Reset the chat',
        },
    },
    opts = {
        answer_header = '## AI',
        auto_insert_mode = true,
        context = 'buffers',
        mappings = {
            submit_prompt = {
                normal = '<cr>',
                insert = '<m-cr>',
            }
        },
        prompts = {
            Explain = {
                mapping = '<m-e>',
                description = 'Explain',
            },
        },
    },
}
