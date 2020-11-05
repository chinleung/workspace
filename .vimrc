" =============== Plugins ===============

call plug#begin('~/.vim/plugins')

" Global Features
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

" Global Styling
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Syntax
"Plug 'leafoftree/vim-vue-plugin'
"Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
"Plug 'StanAngeloff/php.vim', {'for': 'php'}

" PHP Packages
Plug 'arnaud-lb/vim-php-namespace'
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
Plug 'chinleung/vim-pretty-php', {'for': 'php'}
Plug 'mattn/emmet-vim'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}

" COC Packages
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
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile && yarn run build'}

call plug#end()

" =============== Basic Configuration ===============

syntax on
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set guicursor=a:hor20-Cursor
set hidden
set lazyredraw
set nobackup noswapfile
set nocursorline
set novisualbell
set nowrap
set number
set showtabline=2
set splitbelow
set splitright
set synmaxcol=0 cc=81
set wildignore+=*/.git/*,*/node_modules/*,*/.sass-cache/*,*/vendor/*
set mouse=
set relativenumber
set undodir=~/.vim/undo
set undofile

" Shell
if has("unix")
    if(!empty(glob("/bin/zsh")))
        set shell=zsh
    else
        set shell=bash
    endif
endif

" =============== Styling ===============

if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme gruvbox

" JavaScript Conceal
set conceallevel=1
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "↪"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN = "ℕ"
let g:javascript_conceal_static = "•"
let g:javascript_conceal_super = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_noarg_arrow_function = "ƒ"
let g:javascript_conceal_underscore_arrow_function = "ƒ"
let g:javascript_conceal_double_equal = "≈"
let g:javascript_conceal_triple_equal = "≡"
let g:javascript_conceal_or_operator = "∨"
let g:javascript_conceal_and_operator = "∧"
let g:javascript_conceal_greater_equal_operator = "≥"
let g:javascript_conceal_less_equal_operator = "≤"
let g:javascript_conceal_not_equal_operator = "≠"
let g:javascript_conceal_not_strict_equal_operator = "≢"

" =============== Mappings ===============

" Buffer
map <Leader>qt :q!<cr>
map <Leader>qa :qa<cr>
map <Leader>qb :bd!<cr>
map <Leader>r :edit<cr>
map <Leader>w :w<cr>
map <Leader>qw :wq<cr>

" Composer
nmap <Leader>co :split \| terminal composer<space>
nmap <Leader>cr :split \| terminal composer require<space>

" Copy to clipboard
vnoremap <Leader>y "+y

" FZF
map <Leader>/ :FZF --reverse<cr>

" Laravel
nmap <Leader>la :split \| terminal php artisan<space>
nmap <Leader>lm :split \| terminal php artisan make:
nmap <Leader>ln :split \| terminal php artisan nova:
nmap <Leader>lt :split \| terminal php artisan tinker<cr>i
nmap <Leader><Leader>ta :split \| terminal php artisan test --colors<cr>
nmap <Leader><Leader>mm :split \| terminal php artisan migrate<cr>i
nmap <Leader><Leader>mrb :split \| terminal php artisan migrate:rollback<cr>i
nmap <Leader><Leader>mrs :split \| terminal php artisan migrate:refresh --seed<cr>i
nmap <Leader><Leader>mfs :split \| terminal php artisan migrate:fresh --seed<cr>i
nmap <leader><leader>i18n :!php artisan lang:js public/js/i18n.js --quiet<cr><cr>

" Line Movement
nmap <Leader><tab> ddko
imap <Leader><tab> <esc>kddko

" Quick wins
nmap <tab> Hi<tab><esc>
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Remap shift on homerow
map H ^
map L $
map J G
map K gg

" Remove search highlight
map <Leader><esc> :nohlsearch<cr>

" PHPActor
nmap <leader>mv :PhpactorMoveFile<cr>

" Tab configuration
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap to :tabo<CR>

" Tinker
nmap <Leader><Leader>lt :split \| terminal php ~/Projects/so/artisan tinker<cr>i

" Split Management
nmap <Leader>hs :split<cr>
nmap <Leader>vs :vsplit<cr>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <Leader><up> <c-w>+
nmap <Leader><down> <c-w>-
nmap <Leader><left> <c-w>>
nmap <Leader><right> <c-w><
nmap <Leader>= <c-w>=

" Terminal mode
map <Leader><Leader>ts :split \| terminal<cr>i
map <Leader><Leader>tv :vsplit \| terminal<cr>i
map <Leader><Leader>tc :split \| terminal<space>

" UltiSnips
map <Leader>es :UltiSnipsEdit<cr>

" Moving lines
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==

" Fugitive
map <Leader>ga :silent Git add %<cr>
map <Leader>gw :Gwrite<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gd :Gdiff<cr>
map <Leader>gp :Gpull<cr>
map <Leader>gg :Gpush<cr>
map <Leader>gm :Git mergetool<cr>

" Vim Test
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>tv :TestVisit<cr>
tmap <C-o> <C-\><C-n>

" Vim Configurations
map <Leader><Leader>ev :tabedit $MYVIMRC<cr>
map <Leader><Leader>sv :source $MYVIMRC<cr>

" =============== Highlights ===============

" UI
hi CursorLineNr guibg=#282828 ctermbg=235
hi! SignColumn guibg=#282828 ctermbg=235
hi TabLineFill guibg=#282828 ctermbg=235
hi TabLineSel guibg=#282828 ctermfg=yellow

" =============== Plugins Configuration ===============

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#ale#enabled = 1

" Emmet
let g:user_emmet_leader_key='<leader>e'

" Ferret
nmap <leader>s <Plug>(FerretAck)

" FZF
let g:fzf_action = {
    \ 'enter': 'tab split',
    \ 'space': 'edit'
    \ }
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'yoffset': 1, 'border': 'top' } }
let $FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

" PHP CS Fixer
let g:php_cs_fixer_config_file=$HOME."/.workspace-config/.php_cs.dist"

" SuperTab configuration
let g:SuperTabDefaultCompletionType = "<c-n>"

" Vim Test
let test#neovim#term_position = "vert botright 81"
let test#php#phpunit#executable = 'php artisan test'
let test#strategy = "neovim"

" =============== Functions ===============

" PHP Namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction

" Custom syntax highlight for PHP
function! PhpSyntaxOverride()
    hi! link phpDocTags phpDefine
    hi! link phpDocParam phpType
endfunction

" Erase trailing line at the end of file
function! <SID>StripEOFLines()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\($\n\s*\)\+\%$//e
    let @/=_s
    call cursor(l, c)
endfunction

" =============== Automatic Commands ===============

augroup AutoCommands
    autocmd!

    " PHP CS Fixer
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

    " Sort PHP Namespaces
    autocmd BufWritePost *.php silent! call PhpSortUse()

    " Strip end of line
    autocmd BufWritePre *.php,*.py,*.js,*.css,*.txt,*.md,*.rb :call <SID>StripEOFLines()

    " Load custom syntax highlight
    autocmd FileType php call PhpSyntaxOverride()

    " Refresh git
    autocmd CursorHold * CocCommand git.refresh
augroup END

" =============== COC ===============

set shortmess+=c
set signcolumn=yes
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set updatetime=300

hi CocErrorLine guibg=#ce2c28
hi CocErrorSign ctermbg=235 guibg=#282828
hi CocWarningSign ctermbg=235 guibg=#282828
hi CocInfoSign ctermbg=235 guibg=#282828
hi CocHintSign ctermbg=235 guibg=#282828

" coc-git
hi DiffAdd guibg=#282828 ctermbg=235 guifg=#b8bb26 ctermfg=142 cterm=NONE gui=NONE
hi DiffChange guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=108 cterm=NONE gui=NONE
hi DiffDelete guibg=#282828 ctermbg=235 guifg=#fb4934 ctermfg=167 cterm=NONE gui=NONE

" Basic mappings
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> D :call <SID>show_documentation()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Mappings for lists
nnoremap <silent><nowait> <space>a :<C-u>CocFzfList actions<cr>
nnoremap <silent><nowait> <space>c :<C-u>CocFzfList commands<cr>
nnoremap <silent><nowait> <space>d :<C-u>CocFzfList diagnostics<cr>
nnoremap <silent><nowait> <space>e :<C-u>CocFzfList extensions<cr>
nnoremap <silent><nowait> <space>f :<C-u>CocCommand explorer<cr>
nnoremap <silent><nowait> <space>o :<C-u>CocFzfList outline<cr>
nnoremap <silent><nowait> <space>s :<C-u>CocFzfList -I symbols<cr>
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
