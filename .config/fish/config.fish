set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# ls colours
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# simple aliases #
##################
alias ls='ls -GFh'
alias mv='mv -i -v'
alias cp='cp -i -v'
alias c='clear'
alias vi='vim'
alias ping='ping -c 5'
alias top='htop'

# git aliases #
###############
alias g='git'
alias gca='git commit -am'
alias gps='git push'
alias gpl='git pull'
alias gall='git add .'
alias gis='git status'
alias ga='git add'
alias gco='git checkout'

# ls after a cd #
#################
function cs
    cd $argv
    ls
end

# alias setting up a python server at localhost:8000 #
######################################################
alias server='python -m SimpleHTTPServer'

# purgefile cloudflare #
# cfcli                #
########################
alias prg='cfcli purgefile'

# simple jekyll template alias     #
# github.com/Haroenv/simple-jekyll #
####################################
alias template='curl -s https://raw.githubusercontent.com/Haroenv/simple-jekyll/master/install.sh | bash /dev/stdin'

# fuck                 #
# brew install thefuck #
########################
eval (thefuck --alias | tr '\n' ';')
