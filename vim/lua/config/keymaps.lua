-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer
vim.keymap.set("n", "<leader>qw", ":qw<cr>", { desc = "Save and Quit", silent = true })
vim.keymap.set("n", "tn", ":enew<cr>", { silent = true })
vim.keymap.set("n", "<tab>", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<s-tab>", ":bprev<cr>", { silent = true })

-- Composer
vim.keymap.set("n", "<leader><leader>cc", ":split | terminal valet composer<space>")
vim.keymap.set("n", "<leader><leader>ci", ":split | terminal valet composer install<space>")
vim.keymap.set("n", "<leader><leader>cr", ":split | terminal valet composer require<space>")

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Folds
vim.keymap.set("n", "`", "za")
vim.keymap.set("n", "~", "zA")

-- Laravel
vim.keymap.set("n", "<leader><leader>lm", function()
  local command = vim.fn.input("php artisan make")

  if command == "" then
    return
  end

  vim.cmd("split | terminal valet php artisan make:" .. command)
  vim.cmd("startinsert")
end, { desc = "Make", silent = true })

vim.keymap.set(
  "n",
  "<leader><leader>lt",
  ":terminal valet php artisan tinker<cr>:file Tinker<cr>i",
  { desc = "Tinker", silent = true }
)

-- Movement
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "J", "G")
vim.keymap.set({ "n", "v" }, "K", "gg")
vim.keymap.set({ "n", "v" }, "L", "$")
-- vim.keymap.set("i", "<leader><tab>", "<esc>kddko")

-- npm
vim.keymap.set("n", "<leader><leader>ni", ":split | terminal npm install<space>")

-- Terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
