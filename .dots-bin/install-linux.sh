#!/usr/bin/env fish

# Configuration
NVM_DIR="~/.nvm"

# Install post-script

## Fish
sudo apt-get install fish 
sudo chsh -s /usr/bin/fish $USER
curl -L https://get.oh-my.fish | fish
#omf install ### LOOKS LIKE NOT NECESSARRY AS INSTALLED 

## Install NVM (node version manager) & NodeJS
mkdir -p $NVM_DIR
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
#omf install nvm ### ALREADY INSTALLED WITH omf install
nvm install node

## Install NPM packages
npm install -g hyperlayout 

## Update and install Vundle packages
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
function updatevim
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end
updatevim()
