-- Confirm the selection if the completion menu is visible
function confirm_coc_selection()
    if vim.fn.exists('*coc#pum#visible') == 1 then
        if vim.fn.eval('coc#pum#visible()') == 1 then
            return vim.fn["coc#pum#confirm"]()
        else
            return "\n"
        end
    else
        return "\n"
    end
end

-- Show documentation
function show_documentation()
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.call('CocAction', 'doHover')
    end
end

return {
    'neoclide/coc.nvim',
    branch = 'release',
    priority = 500,
    lazy = false,
    config = function ()
        vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.confirm_coc_selection()', { expr = true, noremap = true, silent = true })

        -- Update the highlight
        -- vim.cmd('hi CocErrorLine guibg=#ce2c28')
        vim.cmd('hi CocErrorSign ctermbg=235 guibg=#282828 guifg=#fb4934')
        vim.cmd('hi FgCocErrorFloatBgCocFloating guifg=#fb4934')
        vim.cmd('hi CocHintSign ctermbg=235 guibg=#282828 guifg=#82a498')
        vim.cmd('hi CocInfoSign ctermbg=235 guibg=#282828')
        vim.cmd('hi CocWarningSign ctermbg=235 guibg=#282828 guifg=#fdba48')

        vim.g.coc_global_extensions = {
            '@yaegassy/coc-intelephense',
            '@yaegassy/coc-tailwindcss3',
            'coc-actions',
            'coc-calc',
            'coc-css',
            'coc-emmet',
            'coc-eslint',
            'coc-explorer',
            'coc-git',
            'coc-html',
            'coc-json',
            'coc-lists',
            'coc-pairs',
            'coc-php-cs-fixer',
            'coc-snippets',
            'coc-sql',
            'coc-svg',
            'coc-vetur',
        }
    end,
    keys = {
        { '<leader>rn', '<Plug>(coc-rename)', { noremap = true, silent = true } },
        { '<space>f', ':<C-u>CocCommand explorer<cr>', { noremap = true, nowait = true, silent = true } },
        { 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true } },
        { 'gp', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true } },
        { 'gn', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true } },
        { 'D', ':call v:lua.show_documentation()<CR>', { noremap = true, silent = true } },
    },
}
