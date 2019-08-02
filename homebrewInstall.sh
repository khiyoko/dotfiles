#!/bin/bash

# INSTALL homebrew IF YOU DON'T HAVE
echo "--- Install homebrew... ---"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "--- Run brew doctor... ---"
which brew >/dev/null 2>&1 && brew doctor

echo "--- Run brew update... ---"
which brew >/dev/null 2>&1 && brew update

# INSTALL Homebrew cask
echo "--- Brew tap... ---"
brew tap caskroom/cask
brew tap caskroom/homebrew-versions
brew tap caskroom/fonts
# install a function to brew-cast-upgrade
# command: brew cu or brew cu [CASK] (+ brew cask cleanup after that)
brew tap buo/cask-upgrade

# Formulas TO BE INSTALLED
formulas=(
  ## git
  wget  # file downloader
  curl
  tree
  ctags # class/method jump for programming
  openssl
  lua
  # vim
  macvim
  ## C
  gcc
  ## SQL
  sqlite3
  ## for python
  pyenv
  pyenv-virtualenv
  ## for LaTeXiT
  ghostscript
  imagemagick
  pdf2svg
  ## encoding
  nkf
  ## 7z
  p7zip
  ## file converter
  pandoc
  )

echo "--- Start: brew install apps... ---"
for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

# Applications TO BE INSTALLED
casks=(
  java
  xquartz
  docker
  ## application cleaner
  appcleaner
  ## file/text sharing
  dropbox
  evernote
  ## drawing tool
  skitch
  ## web browser
  google-chrome
  ## communication/chat
  skype
  ## video player
  vlc
  ## unarchiver
  the-unarchiver
  # clipboard expander
  # clipmenu
  ## sqlite DB Browser
  # sqlitebrowser
  ## music 
  spotify
  ## fonts
  font-myrica
  font-myricam
  ## graphics
  gimp
  inkscape
  ## adobe flash-player plugin
  adobe-acrobat-reader
  flash-npapi
  ## text editor
  atom
  ## utility
  iterm2
  cheatsheet
  alfred
  caffeine
  1password
  google-japanese-ime
  ## latex (shoulde be listed here becuase it could take long time...)
  mactex
  )

echo "--- Start: brew cask install apps... ---"
for cask in "${casks[@]}"; do
  brew cask install --appdir="/Applications" $cask
done


echo "--- Run brew upgrade... ---"
brew upgrade

echo "--- Cleaning... ---"
brew cleanup
# brew cask cleanup

cat << END

-----------------------------
  HOMEBREW INSTALLED
-----------------------------

END
