return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        require('nvim-treesitter.configs').setup{
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        }

        -- Set the characters that are concealed to white
        vim.cmd('hi Conceal NONE')
        vim.cmd('hi link Conceal GruvboxWhite')

        -- Global
        vim.cmd('hi link @operator GruvboxWhite')

        -- PHP
        vim.cmd('hi link @constructor.php GruvboxWhite')
        vim.cmd('hi link @function.call.php GruvboxGreen')
        vim.cmd('hi link @function.method.call.php GruvboxWhite')
        vim.cmd('hi link @function.method.php GruvboxWhite')
        vim.cmd('hi link @keyword.modifier.php GruvboxYellow')
        vim.cmd('hi link @keyword.import.php GruvboxAqua')
        vim.cmd('hi link @keyword.parent.php GruvboxYellow')
        vim.cmd('hi link @keyword.type.php GruvboxAqua')
        vim.cmd('hi link @module.php GruvboxWhite')
        vim.cmd('hi link @null.php GruvboxYellow')
        vim.cmd('hi link @punctuation.bracket.php GruvboxOrange')
        vim.cmd('hi link @punctuation.delimiter.php GruvboxWhite')
        vim.cmd('hi link @type.builtin.php GruvboxYellow')
        vim.cmd('hi link @type.definition.php GruvboxWhite')
        vim.cmd('hi link @type.php GruvboxWhite')
        vim.cmd('hi link @type.static.php GruvboxOrange')
        vim.cmd('hi link @string.php GruvboxGreen')
        vim.cmd('hi link @variable.builtin.php GruvboxBlue')
        vim.cmd('hi link @variable.member.php GruvboxWhite')
        vim.cmd('hi link @variable.parameter.php GruvboxBlue')
        vim.cmd('hi link @variable.php GruvboxBlue')
    end,
}
