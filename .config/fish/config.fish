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

# jekyll serve secure #
# requires ca         #
#######################
function jess
  open https://localhost:4000
  jekyll s --ssl-cert ca.crt --ssl-key ca.key
end
function jes
  open http://localhost:4000
  jekyll serve
end

# update github pages          #
# application type will change #
################################
function update-github
  curl -v -X POST -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.mister-fantastic-preview+json" "https://api.github.com/repos/$argv/pages/builds"
en
