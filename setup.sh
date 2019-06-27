main () {
    sh "$HOME/.dotfiles/src/brew.sh"
    sh "$HOME/.dotfiles/src/symlink.sh"
    sh "$HOME/.dotfiles/src/yarn.sh"
    sh "$HOME/.dotfiles/src/pip.sh"
}

main
