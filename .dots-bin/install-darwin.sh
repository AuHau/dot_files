#!/usr/bin/env bash

#set -o errexit

## TODO: Proper error handling

source ./common.sh


#########################################################################
# GUI related

function install_gui {
    install "Hyper" "brew cask install hyper"
    install "VSCode" "brew cask install visual-studio-code"
    install "Fonts" "brew tap homebrew/cask-fonts && brew cask install font-roboto-mono-for-powerline"
    install "Dash" "brew cask install dash"
    install "Franz" "brew cask install franz"
    install "IDEs" "brew cask install webstorm pycharm goland"
    install "NordVPN" "brew cask install nordvpn"
    install "VLC" "brew cask install vlc"
    install "Docker" "brew cask install docker"
}

#########################################################################
# CLI related

function install_cli {
    install "Vim" "brew install vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    #function updatevim
    #    set -lx SHELL (which sh)
    #    vim +BundleInstall! +BundleClean +qall
    #end
    #updatevim

    ## Python
    install "Python env" "brew install pyenv pyenv-virtualenv direnv"
    mkdir -p $(pyenv root)/bin

    ### Install pip and virtualenv to system's Python so direnv works properly
    tell "Installing pip and virtualenv"
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    sudo python /tmp/get-pip.py
    sudo pip install virtualenv

    install "Postgres" "brew install postgres"
    install "GPG" "brew install gnupg pinentry-mac"
}


#########################################################################
# Core install

function install_core {
    tell "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    ## Go
    curl -sSL https://git.io/g-install | bash

    install "NVM" "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash"

    ## Fish shell
    install "Fish" "brew install fish"
    tell "Changing default shell to Fish"
    sudo chsh -s /usr/bin/fish
    install "Oh-My-Fish" "curl -L https://get.oh-my.fish | fish"

    install "Node" "fish \"nvm install node\""

}


#########################################################################
# Hardening security

function hardening {
    ## Disabling Captive portal (eq. WiFi web login)
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false

    ## GPG permissions
    chmod 700 ~/.gnupg
    chmod 600 ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf

    #defaults write -g NSUserKeyEquivalents '{
    #"Mission Control"="\u200b";
    #}'
}

#########################################################################
# Configuration

function configuration {
    # TODO: Ctrl+Left/Right not to change windows
    # TODO: F11, F12 remove completely

    # Press&hold won't show diacricits box
    defaults write -g ApplePressAndHoldEnabled -bool false

    #defaults write -g NSUserKeyEquivalents '{
    #"Mission Control"="\u200b";
    #}'
}

#########################################################################
# MAIN LOGIC

if [[ $(ask "Create SSH key for GitHub?") = true ]]; then
    ssh-keygen -t rsa -b 4096 -C adam@uhlir.dev
    tell "Created key:"
    cat ~/.ssh/id_rsa.pub
    tell "Waiting to import it to GitHub. Press ENTER to continue."
    read
fi

tell "Installing Xcode"
xcode-select --install

git-install $@

install_core

if [[ (ask "Install CLI components?") = true ]]; then
    install_cli
fi

if [[ (ask "Install GUI components?") = true ]]; then
    install_gui
fi

if [[ (ask "Make hardening?") = true ]]; then
    hardening
fi
