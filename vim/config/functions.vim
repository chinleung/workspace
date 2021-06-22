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

" Hide all
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set laststatus=0
        set noruler
        set nonumber
        set norelativenumber
        set noshowcmd
        set noshowmode
        set showtabline=0
    else
        let s:hidden_all = 0
        set laststatus=2
        set relativenumber
        set ruler
        set showcmd
        set showmode
        set showtabline=2
    endif
endfunction

function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
    autocmd FileType php syntax sync fromstart

    " Refresh git
    autocmd CursorHold * CocCommand git.refresh
augroup END
