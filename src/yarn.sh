setup_yarn () {
    printf "Setup yarn...\n"
    cd "$HOME/.config/yarn/global" || exit
    yarn install
    printf "Succeeded to setup yarn!\n\n"

    printf "Upgrade yarn...\n"
    yarn global upgrade
    printf "Succeeded to upgrade yarn!\n\n"

    printf "Clean yarn cache...\n"
    yarn cache clean
    printf "Succeeded to clean yarn cache!\n\n"
}

setup_yarn
