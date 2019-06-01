setup_pip () {
    printf "Update pip...\n"
    pip3 install -U pip
    printf "Succeeded to update pip!\n\n"

    printf "Setup pip...\n"
    pip3 install -r "$HOME/.dotfiles/res/config/pip/requirements.txt"
    printf "Succeeded to setup pip!\n\n"

    printf "Upgrade pip...\n"
    pip3 install -r "$HOME/.dotfiles/res/config/pip/requirements.txt" --upgrade
    printf "Succeeded to upgrade pip!\n\n"
}

setup_pip
