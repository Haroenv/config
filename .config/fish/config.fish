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
alias code='code-insiders'

# git aliases #
###############
alias git='hub'
alias g='git'
alias gca='git commit -am'
alias gps='git push'
alias gpl='git pull'
alias gall='git add .'
alias gis='git status'
alias ga='git add'
alias gco='git checkout'
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'


# alias setting up a python server at localhost:8000 #
######################################################
alias server='python -m SimpleHTTPServer'

