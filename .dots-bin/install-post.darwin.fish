#!/usr/bin/env fish

#########################################################################
# Additional installations

## UI related
brew tap homebrew/cask-fonts
brew cask install font-roboto-mono-for-powerline # Fonts for CLI

## Install VIM with clipboard enabled
brew install vim

## Python
brew install pyenv
brew install pyenv-virtualenv
brew install direnv

### Install pip and virtualenv to system's Python so direnv works properly
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
sudo pip install virtualenv

mkdir -p (pyenv root)/bin

## Postgres
brew install postgres

## Go
brew install go
mkdir -p $GOPATH
mkdir -p $GOPATH/bin

## GPG
brew install gnupg pinentry-mac

## Dash documentation
brew cask install dash 

#########################################################################
# Configuration

## TODO: Set keyboard shortcuts

#########################################################################
# Hardening security

## Disabling Captive portal (eq. WiFi web login)
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false

## GPG permissions
chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf


defaults write -g NSUserKeyEquivalents '{
"Mission Control"="\u200b";
}'
