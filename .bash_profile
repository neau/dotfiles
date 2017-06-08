# neau's .bash_profile 
# Last change on 8th of June 2017

# .bash_work contains work related stuff
source ~/Dropbox/.dotfiles/.bash_work

# Enable visibility of invisible files for Finder in OS X.
# More information on http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
killall Finder /System/Library/CoreServices/Finder.app

# Common aliases
alias ll="ls -lah"

# grabs the latest .bash_profile file and reloads the prompt
alias updatebashprofile="curl https://raw.github.com/erwanjegouzo/dotfiles/master/.bash_profile > ~/.bash_profile && reload"
# hhhhhhnnnnnngggg
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
