#!/usr/bin/env bash

#set -o errexit

## TODO: Proper error handling

source ./common.sh


## Fish
sudo apt-get install fish direnv
sudo chsh -s /usr/bin/fish $USER
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish


## Install NVM (node version manager) & NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
nvm install node

## Pyenv
curl -fsSL https://pyenv.run | bash

## Update and install Vundle packages
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
function updatevim
    export SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end
updatevim()
