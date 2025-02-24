return {
    'tanvirtin/vgit.nvim', branch = 'v1.0.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    event = 'VimEnter',
    config = function()
        require('vgit').setup({
            keymaps = {
                ['n <C-k>'] = function() require('vgit').hunk_up() end,
                ['n <C-j>'] = function() require('vgit').hunk_down() end,
                ['n <leader>ga'] = function() require('vgit').buffer_stage() end,
                ['n <leader>gb'] = function()
                    input({
                        prompt = 'Branch',
                        callback = function (branch)
                            if branch == '' then
                                return
                            end

                            local exists = vim.fn.system('git branch --list '..branch)
                            local args = ''

                            if exists == '' then
                                args = '-b '
                            end

                            vim.cmd(':split | terminal git checkout '..args..branch)
                        end,
                    })
                end,
                ['n <leader>gc'] = function() require('vgit').project_commit_preview() end,
                ['n <leader>gd'] = function() require('vgit').buffer_diff_preview() end,
                ['n <leader>gg'] = function() vim.cmd(':split | terminal git push') end,
                ['n <leader>gp'] = function() vim.cmd(':split | terminal git pull') end,
                ['n <leader>gs'] = function() require('vgit').project_diff_preview() end,
                ['n <leader>gu'] = function() require('vgit').buffer_unstage() end,
            },
            settings = {
                hls = {
                    GitCount = 'Keyword',
                    GitSymbol = 'CursorLineNr',
                    GitTitle = 'Directory',
                    GitSelected = 'QuickfixLine',
                    GitBackground = 'Normal',
                    GitAppBar = 'StatusLine',
                    GitHeader = 'NormalFloat',
                    GitFooter = 'NormalFloat',
                    GitBorder = 'LineNr',
                    GitLineNr = 'LineNr',
                    GitComment = 'Comment',
                    GitSignsAdd = 'GruvboxGreen',
                    GitSignsChange = 'GruvboxOrange',
                    GitSignsDelete = 'GruvboxRed',
                    GitSignsAddLn = 'DiffAdd',
                    GitSignsDeleteLn = 'DiffDelete',
                    GitWordAdd = {
                        gui = nil,
                        fg = nil,
                        bg = '#5d7a22',
                        sp = nil,
                        override = false,
                    },
                    GitWordDelete = {
                        gui = nil,
                        fg = nil,
                        bg = '#960f3d',
                        sp = nil,
                        override = false,
                    },
                    GitConflictCurrentMark = 'DiffAdd',
                    GitConflictAncestorMark = 'Visual',
                    GitConflictIncomingMark = 'DiffChange',
                    GitConflictCurrent = 'DiffAdd',
                    GitConflictAncestor = 'Visual',
                    GitConflictMiddle = 'Visual',
                    GitConflictIncoming = 'DiffChange',
                },
                live_blame = {
                    enabled = true,
                    format = function (blame, git_config)
                        local author = blame.author

                        if author == 'Chin' then
                            author = 'You'
                        end

                        local time = os.difftime(os.time(), blame.author_time) / (60 * 60 * 24 * 30 * 12)
                        local time_divisions = {
                            { 1, 'years' },
                            { 12, 'months' },
                            { 30, 'days' },
                            { 24, 'hours' },
                            { 60, 'minutes' },
                            { 60, 'seconds' },
                        }
                        local counter = 1
                        local time_division = time_divisions[counter]
                        local time_boundary = time_division[1]
                        local time_postfix = time_division[2]
                        while time < 1 and counter ~= #time_divisions do
                            time_division = time_divisions[counter]
                            time_boundary = time_division[1]
                            time_postfix = time_division[2]
                            time = time * time_boundary
                            counter = counter + 1
                        end
                        local commit_message = blame.commit_message

                        if not blame.committed then
                            author = 'You'
                            commit_message = 'Uncommitted changes'
                            return string.format(' %s • %s', author, commit_message)
                        end

                        local max_commit_message_length = 255

                        if #commit_message > max_commit_message_length then
                            commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
                        end

                        return string.format(
                            ' %s • %s, %s • %s',
                            blame.commit_hash:sub(1, 8),
                            author,
                            string.format(
                                '%s %s ago',
                                time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
                                time_postfix
                            ),
                            commit_message
                        )
                    end,
                },
                live_gutter = {
                    enabled = true,
                    edge_navigation = true,
                },
                scene = {
                    diff_preference = 'split', -- unified or split
                    keymaps = {
                        quit = 'q'
                    }
                },
                signs = {
                    priority = 10,
                    definitions = {
                        GitConflictCurrentMark = {
                            linehl = 'GitConflictCurrentMark',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitConflictAncestorMark = {
                            linehl = 'GitConflictAncestorMark',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitConflictIncomingMark = {
                            linehl = 'GitConflictIncomingMark',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitConflictCurrent = {
                            linehl = 'GitConflictCurrent',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitConflictAncestor = {
                            linehl = 'GitConflictAncestor',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitConflictMiddle = {
                            linehl = 'GitConflictMiddle',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitConflictIncoming = {
                            linehl = 'GitConflictIncoming',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitSignsAddLn = {
                            linehl = 'GitSignsAddLn',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitSignsDeleteLn = {
                            linehl = 'GitSignsDeleteLn',
                            texthl = nil,
                            numhl = nil,
                            icon = nil,
                            text = '',
                        },
                        GitSignsAdd = {
                            texthl = 'GitSignsAdd',
                            numhl = nil,
                            icon = nil,
                            linehl = nil,
                            text = '┃',
                        },
                        GitSignsDelete = {
                            texthl = 'GitSignsDelete',
                            numhl = nil,
                            icon = nil,
                            linehl = nil,
                            text = '▔',
                        },
                        GitSignsChange = {
                            texthl = 'GitSignsChange',
                            numhl = nil,
                            icon = nil,
                            linehl = nil,
                            text = '┃',
                        },
                    },
                    usage = {
                        screen = {
                            add = 'GitSignsAddLn',
                            remove = 'GitSignsDeleteLn',
                            conflict_current_mark = 'GitConflictCurrentMark',
                            conflict_current = 'GitConflictCurrent',
                            conflict_middle = 'GitConflictMiddle',
                            conflict_incoming_mark = 'GitConflictIncomingMark',
                            conflict_incoming = 'GitConflictIncoming',
                            conflict_ancestor_mark = 'GitConflictAncestorMark',
                            conflict_ancestor = 'GitConflictAncestor'
                        },
                        main = {
                            add = 'GitSignsAdd',
                            remove = 'GitSignsDelete',
                            change = 'GitSignsChange',
                        },
                    },
                },
                symbols = {
                    void = ' ',
                    open = '',
                    close = '',
                },
            }
        })
    end,
}
