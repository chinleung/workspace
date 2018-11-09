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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
