# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Replace Nano by Vim
export EDITOR='vim'
export VISUAL='vim'

# Change to gruvbox theme
prompt gruvbox
sh ~/.vim/plugins/gruvbox/gruvbox_256palette_osx.sh

# Alias
alias akufen='cd ~/Desktop/Projects/akufen/'
alias baka='cd ~/Desktop/Projects/baka/'
alias hosts='sudo nvim /etc/hosts'
alias ll='clear && ls -al'
alias projects='cd ~/Desktop/Projects/'
alias swoo='cd ~/Desktop/Projects/swoo/'
alias vhost='cd ~/Desktop/Projects/.vhosts/'
alias vhosts='cd ~/Desktop/Projects/.vhosts/'
alias vim='nvim $1'
alias weather='curl -4 http://wttr.in'
alias p='phpunit'
alias pf='phpunit --filter $1'
alias tinker='clear && php artisan tinker'
alias tinx='clear && php artisan tinx'
alias so='cd ~/Desktop/Projects/baka/stackoverflow/'
alias b='blink1-tool --off'
alias es='vim ~/.zshrc'
alias ss='source ~/.zshrc'

# Git
alias gp='git pull'
alias gs='git status'
alias gg='git push $1 $2'
alias ga='git add $1'
alias gc='git commit -m $1'

# Laravel
alias mfs='php artisan migrate:fresh --seed'
alias mrs='php artisan migrate:refresh --seed'

# Change the color of the listing
export CLICOLOR=1
export LSCOLORS=cxexcxdxbxegedabagacad

# Laravel
export PATH=~/.composer/vendor/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules:$PATH

# Function to update the title of the currenttab
function title {
    echo -ne "\033]0;"$*"\007"
}

# Alias PHPUnit to trigger Blink1
alias phpunit='function __phpunit() {
    OUTPUT="$(blink1-tool --list)"
    EXPECTED="no blink(1) devices found"
    if [ "$OUTPUT" = "$EXPECTED" ]
    then
        phpunit "$@"
    else
        blink1-tool --rgb=8080ff && phpunit "$@" && blink1-tool --green --blink 3 || blink1-tool --red --blink 3
    fi
}; __phpunit'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
