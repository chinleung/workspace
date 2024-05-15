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

function! StartBuilds()
    if ! filereadable('package.json')
        return
    endif

    let content = readfile('package.json')
    let scripts = get(json_decode(content), 'scripts')

    if (get(scripts, 'watch') != '0')
        terminal npm run watch
    elseif (get(scripts, 'dev') != '0')
        terminal npm run dev
    endif

    if (match(content, '"vite"') != -1)
        file Vite
    elseif (match(content, '"laravel-mix"') != -1)
        file Mix
    endif
endfunction

function! StartHorizon()
    if ! filereadable('artisan')
        return
    endif

    let packages = readfile('composer.json')

    if (match(packages, 'laravel\/horizon') != -1)
        terminal valet php artisan horizon
        file Horizon
    endif
endfunction

augroup AutoCommands
    autocmd!

    " Strip end of line
    autocmd BufWritePre *.php,*.py,*.js,*.css,*.txt,*.md,*.rb :call <SID>StripEOFLines()

    " Load custom syntax highlight
    autocmd FileType php call PhpSyntaxOverride()
    autocmd FileType php syntax sync fromstart

    " Refresh git
    autocmd CursorHold * CocCommand git.refresh

    " Start Horizon and Vite builds automatically
    autocmd VimEnter * call StartHorizon()
    autocmd VimEnter * call StartBuilds()
augroup END
