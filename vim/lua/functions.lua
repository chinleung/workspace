function input(options)
    local callback = options.callback
    options.callback = nil

    local success, result = pcall(vim.fn.input, options)

    if not success then
        return
    end

    callback(result)
end

local group = vim.api.nvim_create_augroup('AutoCommands', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
    group = group,
    callback = function ()
        -- TODO: Check if COMMIT_EDITMSG or MERGE_MSG exists. If it does, skip the following
        vim.cmd('lua start_horizon()')
        vim.cmd('lua start_builds()')
        vim.cmd('lua start_reverb()')
        vim.cmd('lua start_octane()')
    end,
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    group = group,
    pattern = '*.php',
    command = 'mkview'
})

vim.api.nvim_create_autocmd('BufReadPost', {
    group = group,
    pattern = '*.php',
    callback = function ()
        vim.defer_fn(function ()
            vim.cmd('silent! loadview')
        end, 50)
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    pattern = '*.py,*.js,*.css,*.txt,*.md,*.rb',
    callback = function ()
        vim.cmd('lua strip_end_of_file_lines()')
    end,
})

-- Start Vite/Mix builds
function start_builds()
    local json = require 'dkjson'
    local file = io.open('package.json', 'r')

    if file ~= nil then
        local content = file:read('*all')
        file:close()

        local decoded = json.decode(content)
        local scripts = decoded.scripts

        if scripts ~= nil then
            if scripts.watch ~= nil then
                vim.cmd('terminal npm run watch')
            elseif scripts.dev ~= nil then
                vim.cmd('terminal npm run dev')
            end

            if string.match(content, '"vite"') then
                vim.cmd('file Vite')
            elseif string.match(content, '"laravel%-mix"') then
                vim.cmd('file Mix')
            end
        end
    end
end

-- Start Horizon
function start_horizon()
    local artisan = io.open('artisan', 'r')

    if artisan ~= nil then
        io.close(artisan)

        local packages = io.open('composer.json', 'r')

        if packages ~= nil then
            local content = packages:read('*all')
            packages:close()

            if string.match(content, 'laravel/horizon') then
                vim.cmd('terminal valet php artisan horizon')
                vim.cmd('file Horizon')
            end
        end
    end
end

-- Start Octane
function start_octane()
    local artisan = io.open('artisan', 'r')

    if artisan ~= nil then
        io.close(artisan)

        local packages = io.open('composer.json', 'r')

        if packages ~= nil then
            local content = packages:read('*all')
            packages:close()

            if string.match(content, 'laravel/octane') then
                vim.cmd('terminal valet php artisan octane:start --watch')
                vim.cmd('file Octane')
            end
        end
    end
end


-- Start Reverb
function start_reverb()
    local artisan = io.open('artisan', 'r')

    if artisan ~= nil then
        io.close(artisan)

        local packages = io.open('composer.json', 'r')

        if packages ~= nil then
            local content = packages:read('*all')
            packages:close()

            if string.match(content, 'laravel/reverb') then
                local env_file = io.open('.env', 'r')
                local env = env_file:read('*all')
                local port = env:match('REVERB_PORT=(%d+)')

                env_file:close()

                if port == nil then
                    port = 8080
                end

                vim.cmd('terminal valet php artisan reverb:start --debug --port='..port)
                vim.cmd('file Reverb')
            end
        end
    end
end


-- Strip the end of file lines
function strip_end_of_file_lines()
    local save_search = vim.fn.getreg('/')
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')

    vim.cmd('%s/\\($\\n\\s*\\)\\+\\%$//e')
    vim.fn.setreg('/', save_search)
    vim.api.nvim_win_set_cursor(0, {line, col})
end

-- Generate a UUID
function generate_uuid()
    return vim.fn.system('uuidgen'):gsub('\n', ''):lower()
end

-- Toggle the folds with TreeSitter
vim.g.fold_with_treesitter = 0
function toggle_folds()
    local current = vim.g.fold_with_treesitter

    if current == 1 then
        vim.g.fold_with_treesitter = 0
    else
        vim.g.fold_with_treesitter = 1
    end

    vim.cmd('normal! zx')
end
