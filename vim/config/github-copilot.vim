lua << EOF
require('copilot').setup({
    panel = {
        keymap = {
            open = false,
        }
    },
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<M-CR>",
            next = "<M-j>",
            prev = "<M-k>",
            dismiss = "<M-BS>"
        }
    }
})

require('CopilotChat').setup({
    answer_header = '## AI',
    auto_insert_mode = true,
    context = 'buffers',
    debug = true,
    mappings = {
        submit_prompt = {
            normal = "<CR>",
            insert = "<M-CR>"
        }
    },
    prompts = {
        Explain = {
            mapping = '<leader>ce',
            description = 'Explain',
        },
        Review = {
            mapping = '<leader>cr',
            description = 'Review',
        },
        Tests = {
            mapping = '<leader>cgt',
            description = 'Generate tests',
        },
        Fix = {
            mapping = '<leader>cf',
            description = 'Fix',
        },
        Optimize = {
            mapping = '<leader>co',
            description = 'Optimize',
        },
        Docs = {
            mapping = '<leader>cd',
            description = 'Document',
        },
        CommitStaged = {
            mapping = '<leader>cgm',
            description = 'Generate commit message',
        },
    },
    window = {
        layout = 'float',
        title = 'Chat',
    }
})
EOF
