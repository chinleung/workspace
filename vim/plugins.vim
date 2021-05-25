" 🪄
Plug 'jesseleite/vim-sourcery'

" Global Features
Plug 'ap/vim-buftabline'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chrisbra/Colorizer'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'rhysd/clever-f.vim'
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
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
"Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'aeke/vim-php-cs-fixer', {'for': 'php'}

" Styling
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Syntax
Plug 'sheerun/vim-polyglot'

" COC
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'iamcco/coc-actions', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'junegunn/fzf.vim'
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile && yarn run build'}

" Spotify
Plug 'HendrikPetertje/vimify'
