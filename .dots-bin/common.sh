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