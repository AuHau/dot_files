#!/usr/bin/env fish

# Install post-script

# Oh-My-Fish
curl -L https://get.oh-my.fish | fish
omf install

# Install NVM (node version manager) & NodeJS
mkdir -p $NVM_DIR
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
omf install nvm
nvm install node

# Install NPM packages
npm install -g hyperlayout 

# Update and install Vundle packages
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
function updatevim
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end
updatevim()
