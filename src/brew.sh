#!/bin/bash

install_brew () {
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
            } >> ~/.zshrc
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
    #printf "Install gdb 8.0.1..."
    #brew unlink gdb
    #brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/9ec9fb27a33698fc7636afce5c1c16787e9ce3f3/Formula/gdb.rb
    #printf "Succeed to install gdb 8.0.1!"
    printf "Succeeded to setup brew bundle!\n\n"

    printf "Clean brew cache...\n"
    brew cleanup
    printf "Succeeded to clean brew cache!\n\n"
}

install_brew
setup_brew
