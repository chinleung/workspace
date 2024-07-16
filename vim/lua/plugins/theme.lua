return {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        require('gruvbox').setup({
            overrides = {
                CursorLineNr = {
                    bg = '#282828',
                },
                GruvboxWhite = {
                    bg = '#282828',
                    fg = '#ebdbb2',
                },
                NormalFloat = {
                    bg = '#3c3836',
                },
                SignColumn = {
                    bg = '#282828',
                },
                TabLineFill = {
                    bg = '#282828',
                },
                TabLineSel = {
                    fg = '#fabd2f',
                    bg = '#282828',
                    bold = true,
                },
            }
        })

        vim.cmd([[colorscheme gruvbox]])

        -- Telescope
        vim.cmd('hi link TelescopeMatching GruvboxRed')
        vim.cmd('hi link TelescopeSelection GruvboxYellowBold')
    end,
}
