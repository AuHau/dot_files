#!/usr/bin/env bash

function ask {
    while true; do
        read -p $'\e[33m'"$1"$'?\e[39m (y/n)' yn
        case $yn in
            [Yy]* ) return true; break;;
            [Nn]* ) return false;;
            * ) echo "Please answer y or n.";;
        esac
    done
}

function tell {
    echo $'>\e[34m'"$1"$'\e[39m'
}

function install {
    tell ">> Installing $1"
    eval output="$2"
    if [[ $? != 0 ]]; then
        echo $'\e[31m'"Installing $1"$' faild with output:\n'"$output"$'\e[39m'

        if [[ $(ask "Do you want to continue?") = false ]]; then
            exit
        fi
    fi
}

git help > /dev/null
if [ $? != 0 ]; then
    echo "Install Git first!"
    exit 1
fi;

branch=$1
if [ -z "$branch" ]; then
    branch="master"
fi

if [ $2 = "https" ]; then
    source="https://github.com/AuHau/dot_files.git"
else
    source="git@github.com:AuHau/dot_files.git"
fi

if [ -d $HOME/.dots ]; then
    echo ".dots folder already exist! Remove it first."
    exit 1
fi

git clone --recurse-submodules -b $branch --bare $source $HOME/.dots || exit 1

function config {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}

config checkout
if [ $? != 0 ]; then
    tell "Backing up pre-existing dot files.";
    mkdir -p .dots-backup
    DOTS_FILES=`config checkout 2>&1 | egrep "\s+\." | awk {'print $1'}`
    echo "$DOTS_FILES" | grep / |  xargs -I {} dirname {} | xargs -I {} mkdir -p .dots-backup/{}
    echo "$DOTS_FILES" | xargs -I {} mv {} .dots-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
tell "Git repository setuped.";
