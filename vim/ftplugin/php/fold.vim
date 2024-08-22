set foldmethod=expr
set foldexpr=Fold(v:lnum)

function! Fold(lnum)
    let line = getline(a:lnum)

    " Empty lines get the same fold level as the line before them.
    " e.g. blank lines between class methods continue the class-level fold.
    if line =~? '\v^\s*$'
        return '='
    endif

    " Fold blocks of 'use' statements that have no indentation.
    " i.e. namespace imports
    if line =~? '\v^use\s+' && getline(a:lnum+1) =~? '\v^(use\s+)@!'
        " Stop the fold at the last use statement.
        return '<1'
    elseif line =~? '\v^use\s+'
        return '1'
    endif

    " return nvim_treesitter#foldexpr()
    return 0
endfunction
