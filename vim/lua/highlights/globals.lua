-- Set the characters that are concealed to white
vim.api.nvim_set_hl(0, 'Conceal', { link = 'GruvboxWhite' })

-- Global
vim.api.nvim_set_hl(0, '@operator', { link = 'GruvboxWhite' })
vim.api.nvim_set_hl(0, '@operator.exclamation', { link = 'GruvboxRed' })
