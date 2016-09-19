#!/bin/bash

# INSTALL homebrew IF YOU DON'T HAVE
echo "--- Install homebrew... ---"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "--- Run brew doctor... ---"
which brew >/dev/null 2>&1 && brew doctor

echo "--- Run brew update... ---"
which brew >/dev/null 2>&1 && brew update

echo "--- Run brew upgrade... ---"
brew upgrade --all

# INSTALL Homebrew cask
echo "--- Brew tap... ---"
brew tap caskroom/cask
brew tap caskroom/homebrew-versions

# Formulas TO BE INSTALLED
formulas=(
  git
  wget  # file downloader
  curl
  tree
  ctags # class/method jump for programming
  openssl
  lua
  vim
  # for python
  pyenv
  pyenv-virtualenv
  # for LaTeXiT
  ghostscript
  imagemagick
  pdf2svg
  )

echo "--- Start: brew install apps... ---"
for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

# Applications TO BE INSTALLED
casks=(
  # application cleaner
  appcleaner
  # file/text sharing
  dropbox
  evernote
  google-drive
  # drawing tool
  skitch
  # web browser
  google-chrome
  # communication/chat
  skype
  # video player
  vlc
  # unarchiver
  the-unarchiver
  # clipboard expander
  clipmenu
  # free office
  libreoffice
  # Growl
  growl-fork
  growlnotify
  )

echo "--- Start: brew cask install apps... ---"
for cask in "${casks[@]}"; do
  brew cask install $cask
done

echo "--- Cleaning... ---"
brew cleanup
brew cask cleanup

cat << END

-----------------------------
  HOMEBREW INSTALLED
-----------------------------

END
