
" Mappings: buffer
map <Leader>qa :qa<cr>
map <Leader>qb :bd!<cr>
map <Leader>r :edit<cr>
map <Leader>w :w<cr>
map <Leader>qw :wq<cr>
nnoremap th :bprev<CR>
nnoremap tl :bnext<CR>
nnoremap tn :enew<CR>

" Mappings: coc
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>b :CocList buffers<cr>
nnoremap <silent> D :call <SID>show_documentation()<CR>
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

" Mappings: composer
nmap <Leader><Leader>cc :split \| terminal composer<space>
nmap <Leader><Leader>cr :split \| terminal composer require<space>

" Copy to clipboard
vnoremap <Leader>y "+y

" Mappings: ferret
nmap <leader>s <Plug>(FerretAck)

" FZF
nmap <c-_> :BLines<cr>
map <Leader>/ :FZF --reverse<cr>

" Mappings: laravel
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
nmap <Leader><Leader>lt :split \| terminal php ~/Projects/so/artisan tinker<cr>i

" Line Movement
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
nmap <Leader><tab> ddko
imap <Leader><tab> <esc>kddko

" Mappings: phpactor
nmap <leader>mv :PhpactorMoveFile<cr>

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

" Mappings: vim-fugitive
map <Leader>ga :silent Git add %<cr>
map <Leader>gw :Gwrite<cr>
map <Leader>gs :Git<cr>
map <Leader>gc :Git commit<cr>
map <Leader>gd :Gdiff<cr>
map <Leader>gp :Git pull<cr>
map <Leader>gg :Git push<cr>
map <Leader>gm :Git mergetool<cr>

" Mappings: vim-test
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>tv :TestVisit<cr>
tmap <C-o> <C-\><C-n>
