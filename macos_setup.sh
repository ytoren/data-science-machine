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

## Dev - General
brew cask install atom
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install docker
brew cask install github
brew cask install slack
brew cask isntall awscli ## might require some chown's

## Android
brew cask install horndis ## Allow kernel module!!!
brew cask install android-file-transfer

## Dev - R
brew cask install xquatrz 
brew cask install r-app
brew cask install rstudio 

## Media
brew cask install flux
brew cask install gimp
brew cask install vlc
brew cask install calibre  

## From appstore: pocket

## From time to time run: 
# brew update
# brew upgrade
# brew cask upgrade
