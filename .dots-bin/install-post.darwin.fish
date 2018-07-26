#!/usr/bin/env fish

# Install post-script for macOS

# Install VIM with clipboard enabled
brew install vim

# Python
brew install pyenv
brew install pyenv-virtualenv
brew install direnv

mkdir -p (pyenv root)/bin

# Go
brew install go
mkdir -p $GOPATH
mkdir -p $GOPATH/bin
