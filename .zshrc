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
alias ll='clear && colorls -1 -A --dark'
alias rm='trash'
alias so='cd ~/Desktop/Projects/so/'
alias es='vim ~/.zshrc'
alias ss='source ~/.zshrc'
alias stocks='curl https://terminal-stocks.herokuapp.com/GME,AMC,RKT,SKT,UWMC,TSLA,MTRX.V'

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
alias tinker='clear && php ~/Projects/so/artisan tinker'
alias tinx='clear && php artisan tinx'

# WordPress Alias
alias wp-update='wp core update && wp plugin update --all && wp theme update --all && wp language core update && wp language plugin update --all && wp language theme update --all'

# Change the color of the listing
export CLICOLOR=1
export LSCOLORS=cxexcxdxbxegedabagacad

# Paths
export PATH=~/.composer/vendor/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules:$PATH
export PATH=/usr/local/lib/ruby/gems/2.6.0/bin:$PATH

# Function to update the title of the currenttab
function title {
    echo -ne "\033]0;"$*"\007"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###-tns-completion-start-###
if [ -f /Users/chin/.tnsrc ]; then
    source /Users/chin/.tnsrc
fi
###-tns-completion-end-###

export PATH="/usr/local/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/.gem"
