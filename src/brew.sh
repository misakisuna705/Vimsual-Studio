#!/usr/bin/env bash

install_brew() {
    printf "Test Homebrew...\n"
    if test ! "$(brew -v)"; then
        printf "Install Homebrew...\n"
        if [[ "$OSTYPE" == "darwin"* ]]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        elif [[ "$OSTYPE" == "linux-gnu" ]]; then
            sudo apt-get install linuxbrew-wrapper

            brew
            {
                echo "export PATH='/home/linuxbrew/.linuxbrew/bin:$PATH'"
                echo "export MANPATH='/home/linuxbrew/.linuxbrew/share/man:$MANPATH'"
                echo "export INFOPATH='/home/linuxbrew/.linuxbrew/share/info:$INFOPATH'"
            } >>~/.zshrc
        fi
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
    brew upgrade
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask upgrade
    fi
    printf "Succeeded to upgrade brew bundle!\n\n"

    printf "Clean brew cache...\n"
    brew cleanup
    printf "Succeeded to clean brew cache!\n\n"
}

install_brew
setup_brew
