# tmux

<!-- vim-markdown-toc GFM -->

* [1. 安裝](#1-安裝)
* [2. 配置](#2-配置)
* [3. 命令](#3-命令)

<!-- vim-markdown-toc -->

---

## 1. 安裝

```zsh
brew install tmux # 安裝tmux
```

## 2. 配置

```zsh
set -g default-terminal "screen-256color"
```

## 3. 命令

```zsh
tmux ls # 查詢可復用的session清單
tmux -CC new -s 視窗 # 新建session
tmux -CC attach -t 視窗 # 復用該session
tmux -CC kill-session -t 視窗 # 卸載該session
tmux -CC kill-server # 卸載所有session
```
