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
alias vim='nvim $1'
alias ll='clear && ls -al'
alias weather='curl -4 http://wttr.in'
alias p='phpunit'
alias pf='phpunit --filter $1'
alias so='cd ~/Desktop/Projects/so/'
alias b='blink1-tool --off'
alias es='vim ~/.zshrc'
alias ss='source ~/.zshrc'
alias bs='clear && browser-sync start --proxy https://${PWD##*/}.test --no-notify --https --files="**/*.php" --ignore="vendor"'

# WordPress alias
alias t='cd wp-content/themes/${PWD##*/}'
alias r='cd ../../..';

# Git Alias
alias gp='git pull'
alias gs='git status'
alias gg='git push $1 $2'
alias ga='git add $1'
alias gd='git diff $1'
alias gc='git commit -m $1'
alias gcs='git commit --no-verify -m $1'

# Laravel Alias
alias a='clear && php artisan'
alias mf='php artisan migrate:fresh'
alias mfs='php artisan migrate:fresh --seed'
alias mrs='php artisan migrate:refresh --seed'
alias tinker='clear && cd ~/Projects/so && php artisan tinker'
alias tinx='clear && php artisan tinx'

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

###-tns-completion-start-###
if [ -f /Users/chin/.tnsrc ]; then 
    source /Users/chin/.tnsrc 
fi
###-tns-completion-end-###
