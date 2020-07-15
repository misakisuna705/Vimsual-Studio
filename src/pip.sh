#!/usr/bin/env bash

setup_pip() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        printf "Update pip...\n"
        pip install -U pip
        printf "Succeeded to update pip!\n\n"

        printf "Setup pip...\n"
        pip install -r "$HOME/.dotfiles/res/config/pip/requirements.txt"
        printf "Succeeded to setup pip!\n\n"

        printf "Upgrade pip...\n"
        pip install -r "$HOME/.dotfiles/res/config/pip/requirements.txt" --upgrade
        printf "Succeeded to upgrade pip!\n\n"
        #elif [[ "$OSTYPE" == "linux-gnu" ]]
        #then
    fi
}

setup_pip
