#!/usr/bin/env bash

install_brew() {
    printf "Test Homebrew...\n"
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
        export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
        export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
    fi

    if ! brew -v || false; then
        printf "Install Homebrew...\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

        printf "Succeeded to install Homebrew!\n\n"
    else
        printf "Already have Homebrew!\n\n"
    fi
}

setup_brew() {
    printf "Setup Homebrew...\n"
    brew update
    printf "Succeeded to setup Homebrew!\n\n"

    printf "Setup brew bundle...\n"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew bundle --file="$HOME/.dotfiles/res/config/brew/macOS/Brewfile"
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        brew bundle --file="$HOME/.dotfiles/res/config/brew/linux/Brewfile"
    fi
    printf "Succeeded to setup brew bundle!\n\n"

    printf "Upgrade brew bundle...\n"
    brew upgrade --greedy
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew upgrade --cask
    fi
    printf "Succeeded to upgrade brew bundle!\n\n"

    printf "Clean brew dependency"
    brew autoremove
    printf "Succeeded to clean brew dependency!\n\n"

    printf "Clean brew cache...\n"
    brew cleanup
    printf "Succeeded to clean brew cache!\n\n"
}

install_brew
setup_brew
