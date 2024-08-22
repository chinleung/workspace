return {
    'phpactor/phpactor',
    ft = 'php',
    build = 'composer install --no-dev -o',
    keys = {
        { '<leader>mv', ':PhpactorMoveFile<cr>' },
    },
    init = function ()
        vim.g.phpactorPhpBin = '/opt/homebrew/bin/php'
    end,
}
