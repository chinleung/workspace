call plug#begin('~/.vim/plugins')

" Utilities
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/ferret'
Plug 'schickling/vim-bufonly'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'gcmt/taboo.vim'
Plug 'rhysd/clever-f.vim'
Plug 'jwalton512/vim-blade'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'scrooloose/nerdtree'
Plug 'posva/vim-vue'
Plug 'kien/tabman.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'chinleung/vim-cute-php'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'phpstan/vim-phpstan'

" Dependencies for vim-laravel
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" Auto-completion
if has('nvim')
    Plug 'Shougo/deoplete.nvim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    tmap <C-o> <C-\><C-n>
else
    Plug 'Shougo/neocomplete.vim'
    Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlPCurWD' }
endif

" Color schemes
Plug 'morhetz/gruvbox'

" Syntax highlight
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lunaru/vim-less', { 'for': 'less' }

call plug#end()

syntax on

" Javascript Concealing
set conceallevel=1
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "⇚"
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
set synmaxcol=0 cc=80
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

    " Detect unix operating system
    if has("unix")
        " Retrieve the operating system name
        let s:uname = system("uname -s")

        " Set font according to system
        if s:uname == "Darwin"
            set guifont=Monaco\ for\ Powerline\ Plus\ Nerd\ File\ Types:h13
        else
            set guifont=Monaco\ for\ Powerline\ Plus\ Nerd\ File\ Types:h13
        endif
    endif
endif
" }}}

" Color scheme configuration
set t_Co=256
set background=dark
colorscheme gruvbox

" Map vimrc files edition
map <Leader>ev :tabedit $MYVIMRC<cr>
map <Leader>eg :tabedit $MYGVIMRC<cr>
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
    let g:fzf_action = { 'enter': 'tab split' }
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
\   'php': ['php', 'htmlhint'],
\   'javascript': ['eslint'],
\   'html': ['htmlhint'],
\}

" GitGutter configuration
let g:gitgutter_sign_modified_removed = '*'
hi GitGutterAdd guibg=#282828 ctermbg=235 guifg=#b8bb26 ctermfg=142
hi GitGutterChange guibg=#282828 ctermbg=235 guifg=#8ec07c ctermfg=108
hi GitGutterDelete guibg=#282828 ctermbg=235 guifg=#fb4934 ctermfg=167
hi GitGutterChangeDelete guibg=#282828 ctermbg=235  guifg=#8ec07c ctermfg=108

" NERDCommenter configuration
map <Leader>c :NERDComToggleComment<cr>

" Erase trailing line at the end of file
function! <SID>StripEOFLines()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\($\n\s*\)\+\%$//e
    let @/=_s
    call cursor(l, c)
endfunction

" ColorScheme adjustments
hi SignColumn ctermbg=235
hi CursorLineNr ctermbg=235
hi TabLineFill ctermbg=235
hi TabLineSel ctermfg=yellow

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
nmap <Leader>c iconsole.log();<esc>hi
imap <Leader>c console.log();<esc>hi

" Lazy reindentation
nmap <Leader><tab> ddko
imap <Leader><tab> <esc>kddko

" Lazy buffer handling
map <Leader>q :bd!<cr>
map <Leader>r :edit<cr>
map <Leader>w :w<cr>

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
let g:php_cs_fixer_level = "psr2"

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
nmap <Leader>la :!php artisan<space>
nmap <Leader>lm :!php artisan make:
nmap <Leader>ln :!php artisan nova:
nmap <Leader>lr :tabedit routes/web.php<cr>
nmap <Leader>lt :Console<cr>
nmap <Leader><Leader>mr :Artisan migrate:refresh --seed<cr>
nmap <Leader><Leader>mf :Artisan migrate:fresh --seed<cr>
nmap <Leader><Leader>ca :!composer dump-autoload<cr>
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

    " GitGutter
    autocmd BufWritePost * execute 'GitGutter'
    autocmd BufEnter * execute 'GitGutter'
    autocmd BufEnter * sign define DefaultColumnSign
    autocmd BufEnter * execute 'sign place 9999 line=1 name=DefaultColumnSign buffer=' . bufnr('')

    " PHP Imports
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
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
let test#strategy = "neovim"
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>tv :TestVisit<cr>

" PHPStan
nmap <leader>ps :PHPStanAnalyse<space>
