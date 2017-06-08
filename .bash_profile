# neau's .bash_profile 
# Last change on 8th of June 2017

# .bash_work contains work related stuff
source ~/Users/boyan.aleksiev/Documents/work/.bash_work

# Enable visibility of invisible files for Finder in OS X.
# More information on http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
killall Finder /System/Library/CoreServices/Finder.app

# Common aliases
alias ll="ls -lah"
alias l="ls"

# rm -rf is such a legendarily dangerous command that any shell user should already know to avoid it, 
# regardless of what aliases they have set up. Meanwhile, alias rm = rm -i has always seemed to me an 
# obvious and necessary safeguard, given that rm is irreversible, unlike sending a file to the trash.
alias rmi="rm -i"

# only show dot files
alias lsh="ls -ld .??*"

# LESS man page colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

mkcd () {
    mkdir -p "$*"
    cd "$*"
}

#  Display useful host related informaton
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

function sshKeyGen(){
  echo "What's the name of the Key (no spaced please)? ";
  read name;
  echo "What's the email associated with it? ";
  read email;
  `ssh-keygen -t rsa -f ~/.ssh/id_rsa_$name -C "$email"`;
  ssh-add ~/.ssh/id_rsa_$name
  pbcopy < ~/.ssh/id_rsa_$name.pub;
  echo "SSH Key copied in your clipboard";
}

# grabs the latest .bash_profile file and reloads the prompt
alias updatebashprofile="curl https://raw.github.com/erwanjegouzo/dotfiles/master/.bash_profile > ~/.bash_profile && reload"
# hhhhhhnnnnnngggg
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# rename all the files which contain uppercase letters to lowercase in the current folder
function filestolower(){
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in `ls`
      do
      skip=false
      if [ -d $x ]; then
	read -p "'$x' is a folder, rename it? [y/n]: " renamedir
	if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
	  skip=true
	fi
      fi
      if [ "$skip" == "false" ]; then
        lc=`echo $x  | tr '[A-Z]' '[a-z]'`
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}

# Generates a tree view from the current directory
function tree(){
	pwd
	ls -R | grep ":$" |   \
	sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat
