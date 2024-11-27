return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        require('nvim-treesitter.parsers').get_parser_configs().blade = {
            install_info = {
                url = 'https://github.com/EmranMR/tree-sitter-blade',
                files = { 'src/parser.c' },
                branch = 'main',
            },
            filetype = 'blade',
        }

        require('nvim-treesitter.configs').setup{
            ensure_installed = {
                'bash',
                'blade',
                'html',
                'javascript',
                'markdown',
                'markdown_inline',
                'php',
                'query',
                'regex',
                'vim',
                'vimdoc',
                'vue',
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        }

        -- Load the custom highlights
        require('highlights.globals')
        require('highlights.html')
        require('highlights.php')
    end,
}
