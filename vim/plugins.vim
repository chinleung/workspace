" 🪄
Plug 'jesseleite/vim-sourcery'

" COC
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Global Features
Plug 'ap/vim-buftabline'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'rhysd/clever-f.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'wincent/ferret'

" PHP
Plug 'arnaud-lb/vim-php-namespace'
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
Plug 'chinleung/vim-pretty-php', {'for': 'php'}
Plug 'mattn/emmet-vim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
"Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
"Plug 'aeke/vim-php-cs-fixer', {'for': 'php'}

" Styling
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

" Syntax
Plug 'sheerun/vim-polyglot'

" 🐙 Octo
function! SetupOcto()
    require "octo".setup();
endfunction

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'pwntester/octo.nvim', {'config': function('SetupOcto')}
