# install brew #
################
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install usual installs I do #
###############################
brew install bash-completion curl gdbm libyaml openssl readline screenfetch unar brew-cask emacs grc node python ruby sqlite wget fish

# set up fish #
###############
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# install gem #
###############
gem install jekyll pro
