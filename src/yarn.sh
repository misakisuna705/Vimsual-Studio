#!/usr/bin/env bash

setup_yarn() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        printf "Setup yarn...\n"
        cd "$HOME/.config/yarn/global" || exit
        yarn install
        ln -sf "$HOME/.config/yarn/global/node_modules/" "$HOME/"
        printf "Succeeded to setup yarn!\n\n"

        printf "Upgrade yarn...\n"
        yarn global upgrade
        printf "Succeeded to upgrade yarn!\n\n"

        printf "Clean yarn cache...\n"
        yarn cache clean
        printf "Succeeded to clean yarn cache!\n\n"
        #elif [[ "$OSTYPE" == "linux-gnu" ]]
        #then
    fi
}

setup_yarn
