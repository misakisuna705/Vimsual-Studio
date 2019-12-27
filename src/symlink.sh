#!/bin/bash

symlink () {
    if [[ "$OSTYPE" == "darwin"* ]]
    then
        printf "Symlink Brewfile...\n"
        ln -sf "$HOME/.dotfiles/res/config/brew/macOS/Brewfile" "$HOME"
        printf "Succeeded to symlink Brewfile!\n\n"

        printf "Symlink coc-settings.json...\n"
        mkdir "$HOME/.vim"
        ln -sf "$HOME/.dotfiles/res/config/coc/coc-settings.json" "$HOME/.vim"
        printf "Succeeded to symlink coc-settings.json!\n\n"

        printf "Symlink .gdbinit...\n"
        ln -sf "$HOME/.dotfiles/res/config/gdb/.gdbinit" "$HOME"
        printf "Succeeded to symlink .gdbinit!\n\n"

        printf "Symlink .gitconfig...\n"
        ln -sf "$HOME/.dotfiles/res/config/git/.gitconfig" "$HOME"
        printf "Succeeded to symlink .gitconfig!\n\n"

        printf "Symlink .tmux.conf...\n"
        ln -sf "$HOME/.dotfiles/res/config/tmux/.tmux.conf" "$HOME"
        printf "Succeeded to symlink .tmux.conf!\n\n"

        printf "Symlink .vimrc...\n"
        ln -sf "$HOME/.dotfiles/res/config/vim/.vimrc" "$HOME"
        printf "Succeeded to symlink .vimrc!\n\n"

        printf "Symlink package.json...\n"
        ln -sf "$HOME/.dotfiles/res/config/yarn/package.json" "$HOME/.config/yarn/global"
        printf "Succeeded to symlink package.json!\n\n"

        printf "Symlink .ycm_extra_conf.py...\n"
        ln -sf "$HOME/.dotfiles/res/config/ycm/global/.ycm_extra_conf.py" "$HOME"
        printf "Succeeded to symlink .ycm_extra_conf.py!\n\n"

        printf "Symlink .zshrc...\n"
        ln -sf "$HOME/.dotfiles/res/config/zsh/.zshrc" "$HOME"
        printf "Succeeded to symlink .zshrc!\n\n"
        #elif [[ "$OSTYPE" == "linux-gnu" ]]
        #then
    fi
}

symlink
