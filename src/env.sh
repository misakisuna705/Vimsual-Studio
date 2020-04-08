#!/usr/bin/env bash

setup_env() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        printf "\nTest Command Line Tools...\n"
        if test ! "$(xcode-select -v)"; then
            printf "Install Command Line Tools...\n"
            xcode-select --install
            printf "Succeeded to install Command Line Tools!\n\n"
        else
            printf "Already have Command Line Tools!\n\n"
        fi
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        printf "Update apt...\n"
        sudo apt-get update
        printf "Succeeded to update apt!\n\n"

        printf "Setup apt...\n"
        sudo apt-get upgrade -y
        printf "Succeeded to setup apt!\n\n"

        printf "Clean apt cache...\n"
        sudo apt-get autoclean
        sudo apt-get autoremove -y
        printf "Succeeded to clean apt cache!\n\n"
    fi

    printf "Test zsh...\n"
    if test ! "$(zsh --version)"; then
        printf "Install zsh..."
        if [[ "$OSTYPE" == "linux-gnu" ]]; then
            sudo apt-get install -y zsh
        fi
        printf "Succeeded to install zsh!\n\n"
    else
        printf "Already have zsh!\n\n"
    fi

    printf "Setup zsh...\n"
    if [[ "$0" == "zsh" ]]; then
        printf "Setup zsh..."
        chsh -s "$(which zsh)"
        printf "Succeeded to setup zsh!\n\n"
    else
        printf "Already setup zsh!\n\n"
    fi
}

setup_env
