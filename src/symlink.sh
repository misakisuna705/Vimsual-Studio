#!/bin/bash

symlink () {
    printf "Symlink Brewfile...\n"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        ln -sf "$HOME/.dotfiles/res/config/brew/macOS/Brewfile" "$HOME/"
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        ln -sf "$HOME/.dotfiles/res/config/brew/VM/Brewfile" "$HOME/"
    fi
    printf "Succeeded to symlink Brewfile!\n\n"

    printf "Symlink coc-settings.json...\n"
    if [ ! -d "$HOME/.vim/" ]; then
        mkdir "$HOME/.vim/"
    fi

    ln -sf "$HOME/.dotfiles/res/config/coc/coc-settings.json" "$HOME/.vim/"
    printf "Succeeded to symlink coc-settings.json!\n\n"

    printf "Symlink .gdbinit...\n"
    ln -sf "$HOME/.dotfiles/res/config/gdb/.gdbinit" "$HOME/"
    printf "Succeeded to symlink .gdbinit!\n\n"

    printf "Symlink .gitconfig...\n"
    ln -sf "$HOME/.dotfiles/res/config/git/.gitconfig" "$HOME/"
    printf "Succeeded to symlink .gitconfig!\n\n"

    printf "Symlink .tmux.conf...\n"
    ln -sf "$HOME/.dotfiles/res/config/tmux/.tmux.conf" "$HOME"/
    printf "Succeeded to symlink .tmux.conf!\n\n"

    printf "Symlink .vimrc...\n"
    ln -sf "$HOME/.dotfiles/res/config/vim/.vimrc" "$HOME/"
    printf "Succeeded to symlink .vimrc!\n\n"

    printf "Symlink package.json...\n"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if [ ! -d "$HOME/.config/yarn/global/" ]; then
            mkdir "$HOME/.config/yarn/global/"
        fi

        ln -sf "$HOME/.dotfiles/res/config/yarn/package.json" "$HOME/.config/yarn/global/"
    fi
    printf "Succeeded to symlink package.json!\n\n"

    printf "Symlink .ycm_extra_conf.py...\n"
    ln -sf "$HOME/.dotfiles/res/config/ycm/global/.ycm_extra_conf.py" "$HOME/"
    printf "Succeeded to symlink .ycm_extra_conf.py!\n\n"

    printf "Symlink .zshrc...\n"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        ln -sf "$HOME/.dotfiles/res/config/zsh/macOS/.zshrc" "$HOME/"
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        if grep -q Microsoft /proc/version; then
            ln -sf "$HOME/.dotfiles/res/config/zsh/WSL/.zshrc" "$HOME/"
        else
            ln -sf "$HOME/.dotfiles/res/config/zsh/PD/.zshrc" "$HOME/"
        fi
    fi
    printf "Succeeded to symlink .zshrc!\n\n"
}

symlink
