return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim' },
    },
    keys = {
        {
            '<m-q>',
            desc = 'Quick chat',
            function ()
                input({
                    prompt = 'Question',
                    callback = function (question)
                        if question == '' then
                            return
                        end

                        require('CopilotChat').ask(question, {
                            selection = require('CopilotChat.select').buffers,
                        })
                    end,
                })
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
