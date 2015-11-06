# colours and name #
####################
# Get the Git branch
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Show if there are things to commit
parse_git_dirty () {
	# * if uncommited changes
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" && $(git status 2> /dev/null | tail -n1) ]] && echo -n "*"
	# # if unpushed commits
	[[ $(git log --branches --not --remotes 2> /dev/null) ]] && echo -n "#"
}


set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    # FancyX='\342\234\227'
    # Checkmark='\e2\98\a0'
    FancyX='😱 '
    Checkmark='😀 '

    ## Add a bright white exit status for the last command
    #PS1="$White\$? "

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1="$Green$Checkmark "
    else
        PS1="$Red$FancyX "
    fi

    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    # if [[ $EUID == 0 ]]; then
    #     PS1+="$Red\\h "
    # else
    #     PS1+="$Green\\u@\\h "
    # fi

    # Print the working directory in blue
    PS1+="$Blue\\w"
    # Print the git branch of the working directory in red
    PS1+="$Red\$(parse_git_branch)"
    # Print "*" in red if the branch is not clean
    PS1+="$Red\$(parse_git_dirty)"
    # Print the prompt marker in green, and reset the text color to the default.
    PS1+="$Green\$ $Reset"
}
PROMPT_COMMAND='set_prompt'

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

PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin}

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

# Open with sublime text #
##########################
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
# function subl {
# 	if [[ "$1" ]]; then
# 		for i in "$@"; do
# 			if [[ -e "$i" ]]; then
# 				echo "opening $i"
# 				open -a Sublime\ Text.app "$i"
# 			else
# 				echo "making "$i" and opening it"
# 				touch "$1"
# 				open -a Sublime\ Text.app "$i"
# 			fi
# 		done
# 	else
# 		echo "empty"
# 		open -a Sublime\ Text.app
# 	fi
# }

# Open with Xcode #
###################
function xcode {
	if [[ "$1" ]]; then
		for i in "$@"; do
			if [[ -e "$i" ]]; then
				echo "opening $i"
				open -a Xcode.app "$i"
			else
				echo "making "$i" and opening it"
				touch "$1"
				open -a Xcode.app "$i"
			fi
		done
	else
		echo "empty"
		open -a Xcode.app
	fi
}

# check what's keeping your mac awake #
#######################################
alias awake='pmset -g assertions'

# ls after a cd #
#################
function cdls {
	cd "$1"
	ls
}
alias cd='cdls'
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cdh='cd ~'
alias cdg='cd ~/git/'
alias cdr='cd /'

# mysql #
#########
# export PATH="/usr/local/mysql/bin:$PATH"

# composer #
############
export PATH=~/.composer/vendor/bin:$PATH

# wifi on or off                                #
# wifi on turns wifi on, wifi off turns it off" #
#################################################
alias wifi='networksetup -setairportpower airport'
alias wifirotate='wifi off;wifi on'

# Expand "!" history when pressing space #
##########################################
bind Space:magic-space;

# Move the given file(s) to the Trash. #
########################################
function trash {
	for path in "$@"; do
		# Make relative paths "absolutey".
		[ "${path:0:1}" = '/' ] || path="$PWD/$1";

		# Execute the AppleScript to nudge Finder.
		echo "$(cat <<-EOD
			tell application "Finder"
				delete POSIX file "${path//\"/\"}"
			end
		EOD)" | osascript;
	done;
}

# Print the given text in the center of the screen. #
#####################################################
function center {
	width=$(tput cols);
	str="$@";
	len=${#str};
	[ $len -ge $width ] && echo "$str" && return;
	for ((i = 0; i < $(((($width - $len)) / 2)); i++)); do
		echo -n " ";
	done;
	echo "$str";
}

# Add tab completion for many Bash commands #
# brew install bash-completion              #
#############################################
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git` #
#####################################################################
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards #
###################################################################################
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain` #
# You could just use `-g` instead, but I like being explicit  #
###############################################################
complete -W "NSGlobalDomain" defaults;


# various application openings #
################################
alias pixl='open -a /Applications/Pixelmator.app'
alias chrome='open -a /Applications/Google\ Chrome\ Canary.app'
alias actmon='open /Applications/Utilities/Activity\ Monitor.app/'

# join multiple pdf's                     #
# merged.pdf from.pdf and.pdf *.pdfexport #
###########################################
alias mergepdf='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'


# path for Homebrew #
#####################
export PATH="/usr/local/sbin:$PATH"

# grc, general colouring #
# brew install grc       #
##########################
source "`brew --prefix grc`/etc/grc.bashrc"

# alias setting up a python server at localhost:8000 #
######################################################
alias server='python -m SimpleHTTPServer'

# google say                                   #
# use as googlesay "en" "what you want to say" #
################################################
function googlesay {
	curl -A RG translate\.google\.com/translate_tts -d "tl=$1&q=$*" |mpg123 -;
}

# printing            #
# print "-E language" #
#######################
alias print='enscript -C -B -f Monaco10 -T 4'

# pro cd function  #
# gem install pro  #
####################
pd() {
  local projDir=$(pro search $1)
  cd ${projDir}
}

# jekyll serve on port 80 #
###########################
alias jes='sudo jekyll s --port 80'
