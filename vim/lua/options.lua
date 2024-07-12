vim.opt.background = 'dark'
vim.opt.backup = false
vim.opt.cc = '81'
vim.opt.conceallevel = 1
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.guicursor = 'a:hor20-Cursor'
vim.opt.hidden = true
vim.opt.lazyredraw = false
vim.opt.mouse = ''
vim.opt.relativenumber = true
vim.opt.shell = 'zsh'
vim.opt.shiftwidth = 4
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')
vim.opt.swapfile = false
vim.opt.synmaxcol = 0
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = vim.fn.expand('~/.vim/undo')
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = false
vim.opt.wildignore:append {
	'*/.git/*',
	'*/node_modules/*',
	'*/.sass-cache/*',
	'*/vendor/*'
}
vim.opt.wrap = false

