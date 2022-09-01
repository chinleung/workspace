" Source plugins
call plug#begin('~/.vim/plugged')
    source ~/workspace/vim/plugins.vim
call plug#end()

" Initialize sourcery
call sourcery#init()
