
-- Buffer
vim.keymap.set('n', '<leader>qa', ':bufdo bd<cr>')
vim.keymap.set('n', '<leader>qb', ':bd!<cr>')
vim.keymap.set('n', '<leader>qv', ':q<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>qw', ':wq<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>r', ':edit<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>w', ':w<cr>')
vim.keymap.set('n', 'tn', ':enew<cr>')
vim.keymap.set('n', '<tab>', ':bnext<cr>')
vim.keymap.set('n', '<s-tab>', ':bprev<cr>')

-- Composer
vim.keymap.set('n', '<leader><leader>cc', ':split | terminal composer<space>')
vim.keymap.set('n', '<leader><leader>ci', ':split | terminal composer install<space>')
vim.keymap.set('n', '<leader><leader>cr', ':split | terminal composer require<space>')

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Laravel
vim.keymap.set('n', '<leader>la', ':split | terminal valet php artisan<space>')
vim.keymap.set('n', '<leader>lm', ':split | terminal valet php artisan make:')
vim.keymap.set('n', '<leader>ln', ':split | terminal valet php artisan nova:')
vim.keymap.set('n', '<leader>lt', ':split | terminal valet php artisan tinker<cr>i')
vim.keymap.set('n', '<leader><leader>hs', ':terminal valet php artisan horizon<cr>')
vim.keymap.set('n', '<leader><leader>i18n', ':split | terminal valet php artisan lang:js public/js/i18n.js --quiet<cr>')
vim.keymap.set('n', '<leader><leader>mm', ':split | terminal valet php artisan migrate<cr>i')
vim.keymap.set('n', '<leader><leader>mfs', ':split | terminal valet php artisan migrate:fresh --seed<cr>i')
vim.keymap.set('n', '<leader><leader>ta', ':split | terminal valet php artisan test --colors<cr>')
vim.keymap.set('n', '<leader><leader>ts', ':split | terminal cd ~/Projects/so && valet php artisan tinker<cr>i')

-- Line management
vim.keymap.set('n', '<leader>k', ':m-2<cr>==', { noremap = true })
vim.keymap.set('n', '<leader>j', ':m+<cr>==', { noremap = true })
vim.keymap.set('n', '<leader><tab>', 'ddko')
vim.keymap.set('i', '<leader><tab>', '<esc>kddko')

-- NPM
vim.keymap.set('n', '<leader><leader>ni', ':split | terminal npm install<space>')

-- Quick navigation
vim.keymap.set({'n', 'v' }, 'H', '^')
vim.keymap.set({'n', 'v' }, 'J', 'G')
vim.keymap.set({'n', 'v' }, 'K', 'gg')
vim.keymap.set({'n', 'v' }, 'L', '$')

-- Remove highlighted search
vim.keymap.set({ 'n', 'v' }, '<leader><esc>', ':nohlsearch<cr>')

-- Split management
vim.keymap.set('n', '<leader>hs', vim.cmd.split, { silent = true })
vim.keymap.set('n', '<leader>vs', vim.cmd.vsplit, { silent = true })
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
vim.keymap.set('n', '<leader><up>', '<c-w>+')
vim.keymap.set('n', '<leader><down>', '<c-w>-')
vim.keymap.set('n', '<leader><left>', '<c-w>>')
vim.keymap.set('n', '<leader><right>', '<c-w><')
vim.keymap.set('n', '<leader>=', '<c-w>=')

-- Terminal management
vim.keymap.set('n', '<leader><leader>ts', ':split | terminal<space><cr>i')
vim.keymap.set('n', '<leader><leader>tv', ':vsplit | terminal<cr>i')
