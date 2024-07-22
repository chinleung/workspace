
local group = vim.api.nvim_create_augroup('AutoCommands', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
    group = group,
    callback = function ()
        vim.cmd('lua start_horizon()')
        vim.cmd('lua start_builds()')
        vim.cmd('lua start_reverb()')
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    pattern = '*.php,*.py,*.js,*.css,*.txt,*.md,*.rb',
    callback = function ()
        vim.cmd('lua strip_end_of_file_lines()')
    end,
})

vim.api.nvim_create_autocmd('CursorHold', {
    group = group,
    pattern = '*',
    callback = function ()
        vim.cmd('lua refresh_git_status()')
    end,
})

-- Refresh the git status
function refresh_git_status()
    if vim.fn.exists('CocCommand') == 1 then
        vim.fn.CocCommand('git.refresh')
    end
end

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
                vim.cmd('terminal valet php artisan reverb:start --debug')
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
