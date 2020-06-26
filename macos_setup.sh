#!/bin/sh

## Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

## Web
brew install wget
brew cask install google-chrome
brew cask install firefox
brew cask install skype
brew cask install whatsapp
brew cask install zoomus

## Security
brew cask install 1password

## Dev - tools
brew install git bash-completion
echo "
## Git completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f \"\$(brew --prefix)/etc/bash_completion.d/git-completion.bash\" ] && \\
        . \$(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

## Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1=\"\u@\h \W\[\033[32m\]\\\$(parse_git_branch)\[\033[00m\] \$ \"
" >> ~/.bash_profile

## Dev - Apps
brew cask install atom
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install docker
brew cask install github
brew cask install slack
brew isntall awscli ## might require some chown's

## Android
brew cask install horndis ## Allow kernel module!!!
brew cask install android-file-transfer

## Dev - R
brew cask install xquatrz
brew cask install r
brew cask install rstudio
## for package documentation
brew cask install mactex
# sudo tlmgr update --self
# sudo tlmgr update --all
# sudo tlmgr install titling framed inconsolata
# sudo tlmgr install collection-fontsrecommended

## Media
brew cask install flux
brew cask install gimp
brew cask install vlc
brew cask install calibre

## Spelling
brew cask install hunspell pkg-config
ln -s /usr/local/Cellar/hunspell/1.7.0/lib/libhunspell-1.7.0.dylib /usr/local/Cellar/hunspell/1.7.0/lib/libhunspell.dylib
CFLAGS=$(pkg-config --cflags hunspell) LDFLAGS=$(pkg-config --libs hunspell) pip install hunspell

## Mount NTFS volumes
brew cask install osxfuse
brew install ntfs-3g
## Approve permissions for the kernel module
## To mount run (for example): sudo /usr/local/bin/ntfs-3g /dev/disk1s1 /Volumes/NTFS -olocal -oallow_other
## NOTE: file might not appear on Finder but will appear on terminal.

## From appstore: pocket

## From time to time run:
# brew update
# brew upgrade
# brew cask upgrade
