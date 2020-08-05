" =============== Plugins ===============

call plug#begin('~/.vim/plugins')

" Global Features
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
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
Plug 'sheerun/vim-polyglot'

" PHP Packages
Plug 'arnaud-lb/vim-php-namespace'
Plug 'chinleung/vim-pretty-php', {'for': 'php'}
Plug 'mattn/emmet-vim'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}

" COC Packages
Plug 'antoinemadec/coc-fzf'
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile && yarn run build'}

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

" =============== COC ===============

set shortmess+=c
set signcolumn=yes
set updatetime=300

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

" Disable arrows
noremap <Up> <nop>
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>

" FZF
map <Leader>/ :FZF --reverse<cr>

" Laravel
nmap <Leader>la :split \| terminal php artisan<space>
nmap <Leader>lm :split \| terminal php artisan make:
nmap <Leader>ln :split \| terminal php artisan nova:
nmap <Leader>lt :split \| terminal php artisan tinker<cr>i
nmap <Leader><Leader>mrs :split \| terminal php artisan migrate:refresh --seed<cr>i
nmap <Leader><Leader>mfs :split \| terminal php artisan migrate:fresh --seed<cr>i
nmap <leader><leader>i18n :!php artisan lang:js public/js/i18n.js --quiet<cr><cr>

" Line Movement
nmap <Leader><tab> ddko
imap <Leader><tab> <esc>kddko

" Prepend a <tab>
nmap <tab> Hi<tab><esc>

" Remap shift on homerow
map H ^
map L $
map J G
map K gg

" Remove search highlight
map <Leader><esc> :nohlsearch<cr>

" Tab configuration
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap to :tabo<CR>

" Tinker
nmap <Leader><Leader>lt :split \| terminal php ~/Projects/so/artisan tinker<cr>i

" Split Management
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Terminal mode
map <Leader><Leader>ts :split \| terminal<cr>i
map <Leader><Leader>tv :vsplit \| terminal<cr>i
map <Leader><Leader>te :split \| terminal<space>

" UltiSnips
map <Leader>es :UltiSnipsEdit<cr>

" Moving lines
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==

" Splits
nmap <Leader>hs :split<cr>
nmap <Leader>vs :vsplit<cr>

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
map <Leader>sv :source $MYVIMRC<cr>

" =============== Highlights ===============

" GitGutter
let g:gitgutter_sign_modified_removed = '*'
hi GitGutterAdd guibg=#282828 ctermbg=235 guifg=#b8bb26 ctermfg=142
hi GitGutterChange guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=108
hi GitGutterDelete guibg=#282828 ctermbg=235 guifg=#fb4934 ctermfg=167
hi GitGutterChangeDelete guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=108

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
let g:user_emmet_leader_key='<Leader>'

" FZF
let g:fzf_action = {
    \ 'enter': 'tab split',
    \ 'space': 'edit'
    \ }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

" PHP CS Fixer
let g:php_cs_fixer_config_file=$HOME."/.workspace-config/.php_cs.dist"

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

    " GitGutter
    autocmd BufWritePost * execute 'GitGutter'
    autocmd BufEnter * execute 'GitGutter'
    autocmd BufEnter * sign define DefaultColumnSign
    autocmd BufEnter * execute 'sign place 9999 line=1 name=DefaultColumnSign buffer=' . bufnr('')

    " Load custom syntax highlight
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" =============== COC ===============

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

hi CocErrorLine guibg=#ce2c28
hi CocErrorSign ctermbg=235 guibg=#282828
hi CocWarningSign ctermbg=235 guibg=#282828
hi CocInfoSign ctermbg=235 guibg=#282828
hi CocHintSign ctermbg=235 guibg=#282828

nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> D :call <SID>show_documentation()<CR>
nnoremap <silent><nowait> <leader>a :<C-u>CocFzfList actions<cr>

" Mappings for CoCList
nnoremap <silent><nowait> <space>d :<C-u>CocFzfList diagnostics<cr>
nnoremap <silent><nowait> <space>e :<C-u>CocFzfList extensions<cr>
nnoremap <silent><nowait> <space>c :<C-u>CocFzfList commands<cr>
nnoremap <silent><nowait> <space>o :<C-u>CocFzfList outline<cr>
nnoremap <silent><nowait> <space>s :<C-u>CocFzfList -I symbols<cr>
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
