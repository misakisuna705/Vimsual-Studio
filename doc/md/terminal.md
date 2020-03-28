# terminal

<!-- vim-markdown-toc GFM -->

* [macOS](#macos)
    - [iterm2](#iterm2)
        + [安裝](#安裝)
        + [字型](#字型)
        + [主題](#主題)
        + [背景](#背景)
    - [tmux](#tmux)
        + [安裝](#安裝-1)
        + [命令](#命令)
    - [zsh](#zsh)
        + [設定](#設定)
        + [插件](#插件)
            * [安裝](#安裝-2)
            * [命令](#命令-1)
            * [插件](#插件-1)

<!-- vim-markdown-toc -->

---

## macOS

### iterm2

#### 安裝

```zsh
brew cask install iterm2 # 安裝iterm2
```

#### 字型

```zsh
brew cask install font-source-code-pro # 安裝Adobe Source Code Pro
```

#### 主題

-   [Monokai_Soda.itermcolors](https://github.com/misakisuna705/Vimsual-Studio/blob/master/res/theme/Monokai_Soda.itermcolors)

#### 背景

-   [iCloud](https://github.com/misakisuna705/Vimsual-Studio/blob/master/res/picture/iCloud.jpg)

### tmux

#### 安裝

```zsh
brew install tmux # 安裝tmux
```

#### 命令

```zsh
tmux ls # 查詢可復用的session清單
tmux -CC new -s 視窗 # 新建session
tmux -CC attach -t 視窗 # 復用該session
tmux -CC kill-session -t 視窗 # 卸載該session
tmux -CC kill-server # 卸載所有session
```

### zsh

#### 設定

```zsh
chsh -s /bin/zsh # 將shell設定為zsh
```

#### 插件

##### 安裝

```zsh
brew install antigen # 安裝antigen
```

##### 命令

```zsh
antigen list # 查詢已安裝插件清單
antigen update 插件 # 安裝該插件
antigen update # 升級所有插件
antigen reset # 重設所有插件
```

##### 插件

|              antigen              |
| :-------------------------------: |
|         sindresorhus/pure         |
| zsh-users/zsh-syntax-highlighting |
|   zsh-users/zsh-autosuggestions   |
