-- Load personal configuration files
require('functions')
require('keymaps')
require('options')

-- Bootstrap lazy.nvim
local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(path) then
    local repository = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        repository,
        path
    })
end

vim.opt.rtp:prepend(path)

-- Set up lazy.nvim
require("lazy").setup('plugins', {
    change_detection = {
        notify = false,
    },
})
