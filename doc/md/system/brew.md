# brew

<!-- vim-markdown-toc GFM -->

* [1. cellar](#1-cellar)
    - [1.1. 安裝](#11-安裝)
    - [1.2. 命令](#12-命令)
    - [1.3. 插件](#13-插件)
        + [macOS](#macos)
        + [linux](#linux)
* [2. cask](#2-cask)
    - [2.1. 安裝](#21-安裝)
    - [2.2. 命令](#22-命令)
    - [2.3. 程式](#23-程式)
* [3. font](#3-font)
    - [3.1. 安裝](#31-安裝)
    - [3.2. 字型](#32-字型)

<!-- vim-markdown-toc -->

---

## 1. cellar

### 1.1. 安裝

```zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # 安裝brew
```

### 1.2. 命令

```zsh
brew search 插件 # 搜尋某插件與其相關插件

brew list # 查詢已安裝插件清單

brew info # 查詢已安裝插件數量與大小
brew info 插件 # 查詢該插件詳細資料

brew install 插件 # 安裝該插件
brew uninstall 插件 # 解除安裝該插件

brew update # 更新brew源同時表列過期插件

brew upgrade 插件 # 升級該插件
brew upgrade # 升級所有插件

brew cleanup # 清理暫存檔

brew doctor # 檢查brew

brew bundle # 從Brewfile安裝cellar / cask / font
brew bundle dump # 生成Brewfile
brew bundle dump --force # 複寫Brewfile
```

### 1.3. 插件

#### macOS

-   allegro
-   antigen
-   astyle
-   cmake
-   cppcheck
-   gdb
-   go
-   icarus-verilog
-   nasm
-   ninja
-   python
-   ripgrep
-   shellcheck
-   sshfs
-   tmux
-   universal-ctags
-   vim
-   wget
-   yarn

#### linux

-   antigen
-   astyle
-   cmake
-   cppcheck
-   gdb
-   icarus-verilog
-   llvm
-   nasm
-   ninja
-   python
-   ripgrep
-   shellcheck
-   sshfs
-   tmux
-   universal-ctags
-   vim
-   yarn

## 2. cask

### 2.1. 安裝

```zsh
brew tap caskroom/cask # 安裝caskroom/cask
```

### 2.2. 命令

```zsh
brew cask list # 查詢已安裝程式清單

brew cask info 程式 # 查詢該程式詳細資料

brew cask install 程式 # 安裝該程式
brew cask uninstall 程式 # 解除安裝該程式

brew cask upgrade 程式 # 升級該程式
brew cask upgrade # 升級所有程式
```

### 2.3. 程式

-   1password
-   android-studio
-   appcleaner
-   calibre
-   docker
-   dotnet-sdk
-   duet
-   google-backup-and-sync
-   google-drive-file-stream
-   gtkwave
-   handbrake
-   iina
-   iterm2
-   java
-   keka
-   mediainfo
-   megasync
-   mipony
-   osxfuse
-   tickeys
-   transmission
-   unity-hub
-   wireshark
-   xquartz

## 3. font

### 3.1. 安裝

```zsh
brew tap caskroom/fonts # 安裝caskroom/fonts
```

### 3.2. 字型

-   font-source-code-pro
