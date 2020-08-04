call plug#begin('~/.vim/plugins')

" Utilities
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/ferret'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'scrooloose/nerdtree'
Plug 'kien/tabman.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'chinleung/vim-pretty-php', { 'for': 'php' }
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'phpstan/vim-phpstan'
Plug 'rhysd/clever-f.vim'
Plug 'sheerun/vim-polyglot'
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
Plug 'phpactor/phpactor', { 'for': 'php', 'do': 'composer install' }

" Auto-completion
if has('nvim')
    Plug 'Shougo/deoplete.nvim'
    Plug 'kristijanhusak/deoplete-phpactor', { 'for': 'php' }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
else
    Plug 'Shougo/neocomplete.vim'
    Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlPCurWD' }
endif

" Color schemes
Plug 'morhetz/gruvbox'

call plug#end()

syntax on

" Javascript Concealing
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

filetype plugin indent on

" Basic configuration {{{
set nowrap
set number
set hidden
set nocursorline
set lazyredraw
set novisualbell
set showtabline=2
set nobackup noswapfile
set synmaxcol=0 cc=81
set completeopt=longest,menuone
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set wildignore+=*/.git/*,*/node_modules/*,*/.sass-cache/*,*/vendor/*
set mouse=
set relativenumber

if !has('nvim')
    set autoread
    set scrolljump=25
    set backspace=indent,eol,start
    set hlsearch incsearch
    set wildmenu
endif

if has("unix")
    if(!empty(glob("/bin/zsh")))
        set shell=zsh
    else
        set shell=bash
    endif
endif
" }}}

" Graphical User Interface configuration {{{
if has("gui_running")
    " Remove all toolbars and scroll bars
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L

    " Set default lines and columns
    set lines=50 columns=98

    set guifont=DankMono\ Nerd\ Font:h18
    set linespace=20
endif
" }}}

" Color scheme configuration
if has('termguicolors')
  set termguicolors
endif

set t_Co=256
set background=dark
colorscheme gruvbox

hi SignColumn guibg=#282828 ctermbg=235
hi CursorLineNr guibg=#282828 ctermbg=235
hi TabLineFill guibg=#282828 ctermbg=235
hi TabLineSel guibg=#282828 ctermfg=yellow

" Map vimrc files edition
map <Leader><Leader>ev :tabedit $MYVIMRC<cr>
map <Leader><Leader>eg :tabedit $MYGVIMRC<cr>
map <Leader>sv :source $MYVIMRC<cr>
map <Leader>sg :source $MYGVIMRC<cr>

" Remap shift on homerow
map H ^
map L $
map J G
map K gg

" Tab configuration
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap to :tabo<CR>

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#ale#enabled = 1

" Gotta stop cheating (disabled arrow mapping for my own good)
noremap <Up> <nop>
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>

" Map to remove search highlight
map <Leader><esc> :nohlsearch<cr>

" EasyMotion configuration
let g:EasyMotion_leader_key = '<Leader>'

" SuperTab configuration
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neocomplete/Deoplete configuration
if has('nvim')
    let g:deoplete#enable_at_startup = 1
else
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#min_keyword_length = 3
endif

"" FZF configuration
if has('nvim')
    let g:fzf_action = {
        \ 'enter': 'tab split',
        \ 'space': 'edit'
        \ }
    let g:fzf_height = '25%'
    let $FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
endif

" CtrlP configuration
if has('nvim')
    map <Leader>/ :FZF --reverse<cr>
else
    map <Leader>/ :CtrlPCurWD<cr>
    if has("unix")
        let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    endif
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_working_path_mode = 'rw'
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': [],
                \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
                \ }
endif

" Fugitive configuration
map <Leader>ga :silent Git add %<cr>
map <Leader>gw :Gwrite<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gd :Gdiff<cr>
map <Leader>gp :Gpull<cr>
map <Leader>gg :Gpush<cr>
map <Leader>gm :Git mergetool<cr>

" Ale Configuration
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '🔸'
let g:ale_linters = {
\   'json': ['jsonlint'],
\   'php': ['php'],
\   'html': ['htmlhint'],
\}

" GitGutter configuration
let g:gitgutter_sign_modified_removed = '*'
hi GitGutterAdd guibg=#282828 ctermbg=235 guifg=#b8bb26 ctermfg=142
hi GitGutterChange guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=108
hi GitGutterDelete guibg=#282828 ctermbg=235 guifg=#fb4934 ctermfg=167
hi GitGutterChangeDelete guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=108

" Erase trailing line at the end of file
function! <SID>StripEOFLines()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\($\n\s*\)\+\%$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Auto indentation
nmap <Leader>i gg=G<cr>

" Lazy tab
nmap <tab> Hi<tab><esc>

" Splits
nmap <Leader>hs :split<cr>
nmap <Leader>vs :vsplit<cr>

" Lazy var dumps and logs
nmap <Leader>v ivar_dump(); die;<esc>6hi
imap <Leader>v var_dump(); die;<esc>6hi
nmap <Leader>cl iconsole.log();<esc>hi
imap <Leader>cl console.log();<esc>hi

" Lazy reindentation
nmap <Leader><tab> ddko
imap <Leader><tab> <esc>kddko

" Lazy buffer handling
map <Leader>qt :q!<cr>
map <Leader>qa :qa<cr>
map <Leader>qb :bd!<cr>
map <Leader>r :edit<cr>
map <Leader>w :w<cr>
map <Leader>qw :wq<cr>

" Terminal mode
map <Leader><Leader>ts :split \| terminal<cr>i
map <Leader><Leader>tv :vsplit \| terminal<cr>i
map <Leader><Leader>te :split \| terminal<space>

" Moving lines
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==

" Copy to clipboard
vnoremap <Leader>y "+y

" Change the mouse cursor to underline
set guicursor=a:hor20-Cursor

" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        exe 'call deoplete#disable()'
    elseif exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#enable')
        exe 'call deoplete#enable()'
    elseif exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction

" Tagbar configuration
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
function! RefreshTagbar()
    execute ':TagbarClose'
    execute ':TagbarOpen'
endfunction
nmap <Leader>br :call RefreshTagbar()<cr>
imap <Leader>br <esc>:call RefreshTagbar()<cr>i
nmap <Leader>bt :TagbarToggle<cr>
imap <Leader>bt <esc>:TagbarOpen<cr>i

" PHP CS Fixer configuration
let g:php_cs_fixer_config_file=$HOME."/.workspace-config/.php_cs.dist"

" Split management
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" Laravel Commands
nmap <Leader>la :split \| terminal php artisan<space>
nmap <Leader>lm :split \| terminal php artisan make:
nmap <Leader>ln :split \| terminal php artisan nova:
nmap <Leader>lr :tabedit routes/web.php<cr>
nmap <Leader>lt :split \| terminal php artisan tinker<cr>i
nmap <Leader><Leader>lt :split \| terminal php ~/Projects/so/artisan tinker<cr>i
nmap <Leader><Leader>mr :split \| terminal php artisan migrate:refresh --seed<cr>i
nmap <Leader><Leader>mf :split \| terminal php artisan migrate:fresh --seed<cr>i
nmap <leader><leader>i1 :!php artisan lang:js public/js/i18n.js --quiet<cr><cr>

" Automatic commands
augroup AutoCommands
    autocmd!

    " Strip end of line
    autocmd BufWritePre *.php,*.py,*.js,*.css,*.txt,*.md,*.rb :call <SID>StripEOFLines()

    " TagBar
    " autocmd BufWritePost * nested :call tagbar#autoopen(0)

    " PHP CS Fixer
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

    " Sort PHP Namespaces
    autocmd BufWritePost *.php silent! call PhpSortUse()

    " Cursor line on insert mode
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul

    " GitGutter
    autocmd BufWritePost * execute 'GitGutter'
    autocmd BufEnter * execute 'GitGutter'
    autocmd BufEnter * sign define DefaultColumnSign
    autocmd BufEnter * execute 'sign place 9999 line=1 name=DefaultColumnSign buffer=' . bufnr('')

    " Load custom syntax highlight
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" Custom blade directives
let g:blade_custom_directives_pairs = {
            \    'header': 'endheader',
            \    'input': 'endinput',
            \  }

" PHP Namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction

" GutenTags Status
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", ".git", "node_modules", "*.vim/bundle/*"]

" Persistent Undo
set undodir=~/.vim/undo
set undofile

" Snippets configuration
map <Leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsExpandTrigger="-<cr>"

" Unit Testing
let test#neovim#term_position = "vert botright 81"
let test#php#phpunit#executable = 'php artisan test'
let test#strategy = "neovim"
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>tv :TestVisit<cr>
tmap <C-o> <C-\><C-n>

" Fix the guicursor glitch
let g:clever_f_hide_cursor_on_cmdline = 0

" Custom syntax highlight for PHP
function! PhpSyntaxOverride()
    hi! link phpDocTags phpDefine
    hi! link phpDocParam phpType
endfunction

" PHPActor
let g:phpactorBranch = "develop"
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'
nmap <Leader>pcm :call phpactor#ContextMenu()<CR>
nmap <Leader>pcv :call phpactor#ChangeVisibility()<CR>
nmap <Leader>pdt :call phpactor#GotoDefinitionTab()<CR>
nmap <Leader>pdv :call phpactor#GotoDefinitionVsplit()<CR>
nmap <Leader>pec :call phpactor#ClassExpand()<CR>
nmap <Leader>pia :call phpactor#ImportMissingClasses()<CR>
nmap <Leader>pmf :call phpactor#MoveFile()<CR>
nmap <Leader>pn :call phpactor#Navigate()<CR>
nmap <Leader>pt :call phpactor#Transform()<CR>
nmap <Leader>pu :call phpactor#UseAdd()<CR>
nmap <silent><Leader>pev :call phpactor#ExtractExpression(v:false)<CR>
vmap <silent><Leader>pev :<C-U>call phpactor#ExtractExpression(v:true)<CR>
vmap <silent><Leader>pem :<C-U>call phpactor#ExtractMethod()<CR>

" Builds
nmap <Leader><Leader>bs :tabnew \| terminal npm run watch<CR>th

" Composer
nmap <Leader>co :split \| terminal composer<space>
nmap <Leader>cr :split \| terminal composer require<space>

" Startify
let g:startify_change_to_vcs_root = 1
