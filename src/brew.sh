#!/bin/bash

install_brew () {
    if [[ "$OSTYPE" == "darwin"* ]]
    then
        printf "\nTest Homebrew...\n"
        if test ! "$(brew -v)"
        then
            printf "Install Homebrew...\n"
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            printf "Succeeded to install Homebrew!\n\n"
        else
            printf "Already have Homebrew!\n\n"
        fi
        #elif [[ "$OSTYPE" == "linux-gnu" ]]
        #then
    fi
}

setup_brew() {
    if [[ "$OSTYPE" == "darwin"* ]]
    then
        printf "Setup brew bundle...\n"
        brew bundle --file="$HOME/.dotfiles/res/config/brew/macOS/Brewfile"
        #printf "Install gdb 8.0.1..."
        #brew unlink gdb
        #brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/9ec9fb27a33698fc7636afce5c1c16787e9ce3f3/Formula/gdb.rb
        #printf "Succeed to install gdb 8.0.1!"
        printf "Succeeded to setup Homebrew!\n\n"

        printf "Clean brew cache...\n"
        brew cleanup
        printf "Succeeded to clean brew cache!\n\n"
    elif [[ "$OSTYPE" == "linux-gnu" ]]
    then
        printf "Setup brew bundle...\n"
        brew bundle --file="$HOME/.dotfiles/res/config/brew/VM/Brewfile"
        #printf "Install gdb 8.0.1..."
        #brew unlink gdb
        #brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/9ec9fb27a33698fc7636afce5c1c16787e9ce3f3/Formula/gdb.rb
        #printf "Succeed to install gdb 8.0.1!"
        printf "Succeeded to setup Homebrew!\n\n"

        printf "Clean brew cache...\n"
        brew cleanup
        printf "Succeeded to clean brew cache!\n\n"
    fi
}

install_brew
setup_brew
