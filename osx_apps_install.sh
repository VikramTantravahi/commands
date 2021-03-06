#!/bin/bash

echo "Starting Apps Installation"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Installing packages..."
PACKAGES=(
tree
tmux
mupdf-tools
jq
youtube-dl
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
appcleaner
anaconda
boom
caffeine
calibre
docker #Docker For Mac
firefox
flash-npapi
google-chrome
google-featured-photos
handbrake
opera
skype
skypewebplugin
spotify
torbrowser
vagrant
virtualbox
vlc
whatsapp
xmind
xquartz
xquartz
youtube-to-mp3
zotero
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Cleaning up..."
brew cask cleanup

echo "Apps installation complete"
export PS1="\[\e[32;1m\]\u@\[\e[32;1m\]\h: \[\e[34;1m\]\W \[\e[0m\]\$ "
echo "Prompt Update"
