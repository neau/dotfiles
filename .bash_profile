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

# grabs the latest .bash_profile file and reloads the prompt
alias updatebashprofile="curl https://raw.github.com/erwanjegouzo/dotfiles/master/.bash_profile > ~/.bash_profile && reload"
# hhhhhhnnnnnngggg
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

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
