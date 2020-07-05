# package

<!-- vim-markdown-toc GFM -->

* [docker](#docker)
* [xcode](#xcode)
* [apt](#apt)
    - [命令](#命令)
    - [插件](#插件)
* [brew](#brew)
    - [cellar](#cellar)
        + [安裝](#安裝)
        + [命令](#命令-1)
        + [插件](#插件-1)
    - [cask](#cask)
        + [設置](#設置)
        + [命令](#命令-2)
        + [插件](#插件-2)
    - [font](#font)
        + [設置](#設置-1)
        + [命令](#命令-3)
        + [插件](#插件-3)
* [pip](#pip)
    - [安裝](#安裝-1)
    - [命令](#命令-4)
    - [插件](#插件-4)
* [yarn](#yarn)
    - [安裝](#安裝-2)
    - [命令](#命令-5)
    - [插件](#插件-5)
* [go](#go)
    - [命令](#命令-6)
    - [插件](#插件-6)
* [vim-plug](#vim-plug)
    - [命令](#命令-7)
    - [插件](#插件-7)
* [coc](#coc)
    - [命令](#命令-8)
    - [插件](#插件-8)

<!-- vim-markdown-toc -->

---

## docker

```zsh
# system

docker system df # 表列映像、容器、儲區
docker system prune -f # 清理多餘映像、容器、儲區

# build

docker login # 登入用戶
docker build -t 映像 路徑 # 建構映像
docker tag 映像 用戶/映像 # tag映像
docker push 用戶/映像 # 上傳映像

# image

docker search 映像 # 搜尋某映像
docker images # 查詢已安裝映像
docker pull 映像 # 安裝該映像
docker rmi 映像 # 解除安裝該映像

# container

docker ps -a # 查詢已實體化的容器
docker run --name 容器 -it -v 被掛載檔案系統路徑:掛載點 映像 # 實體化該映像為容器
docker rm -v 容器 # 移除該容器與對應儲區
docker start -i 容器 # 啟動該容器
docker stop 容器 # 停止該容器

# volume

docker volume ls # 查詢已分配的儲區
docker volume rm 儲區 # 移除已分配儲區
```

## xcode

```zsh
xcode-select --install # 安裝Command Line Tools for Xcode
```

## apt

### 命令

```zsh
sudo apt list --installed # 查詢已安裝插件清單
sudo apt install # 安裝該插件
sudo apt remove # 解除安裝該插件
sudo apt update # 更新apt源
sudo apt upgrade # 升級所有插件
sudo apt autoclean # 清理暫存檔
sudo apt autoremove # 清理依賴
```

### 插件

|        VM         |
| :---------------: |
|        zsh        |
| linuxbrew-wrapper |
|  openssh-server   |
|  xfce4-terminal   |
|       hime        |
| chromium-browser  |
|   gnome-tweaks    |
|       plank       |

## brew

### cellar

#### 安裝

```zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # 安裝brew
```

#### 命令

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
brew link # 串連命令與插件
brew unlink # 斷開命令與插件
```

#### 插件

|      macOS      |     ubuntu      |
| :-------------: | :-------------: |
|     allegro     |                 |
|     antigen     |     antigen     |
|     astyle      |     astyle      |
|      cmake      |      cmake      |
|    cppcheck     |    cppcheck     |
|       gdb       |       gdb       |
|     global      |                 |
|       go        |                 |
| icarus-verilog  | icarus-verilog  |
|    inetutils    |                 |
|      llvm       |      llvm       |
|      nasm       |      nasm       |
|      ninja      |      ninja      |
|     python      |     python      |
|     ripgrep     |     ripgrep     |
|   shellcheck    |   shellcheck    |
|      sshfs      |      sshfs      |
|   swiftformat   |                 |
|    swiftlint    |                 |
|      tmux       |      tmux       |
|      tree       |                 |
| universal-ctags | universal-ctags |
|       vim       |       vim       |
|      wget       |                 |
|      yarn       |      yarn       |
|                 |    net-tools    |

### cask

#### 設置

```zsh
brew tap caskroom/cask # 安裝caskroom/cask
```

#### 命令

```zsh
brew cask list # 查詢已安裝程式清單
brew cask info 程式 # 查詢該程式詳細資料
brew cask install 程式 # 安裝該程式
brew cask uninstall 程式 # 解除安裝該程式
brew cask upgrade 程式 # 升級該程式
brew cask upgrade # 升級所有程式
```

#### 插件

|           cask           |
| :----------------------: |
|        1password         |
|      android-studio      |
|        appcleaner        |
|         calibre          |
|          docker          |
|        dotnet-sdk        |
|           duet           |
|  google-backup-and-sync  |
| google-drive-file-stream |
|         gtkwave          |
|        handbrake         |
|           iina           |
|          iterm2          |
|           java           |
|           keka           |
|        mediainfo         |
|         megasync         |
|          motrix          |
|      mysqlworkbench      |
|         osxfuse          |
|         tickeys          |
|        unity-hub         |
|      vmware-fusion       |
|        wireshark         |
|         xquartz          |

### font

#### 設置

```zsh
brew tap caskroom/fonts # 安裝caskroom/fonts
```

#### 命令

```zsh
brew cask list # 查詢已安裝程式清單
brew cask info 程式 # 查詢該程式詳細資料
brew cask install 程式 # 安裝該程式
brew cask uninstall 程式 # 解除安裝該程式
brew cask upgrade 程式 # 升級該程式
brew cask upgrade # 升級所有程式
```

#### 插件

|         font         |
| :------------------: |
| font-source-code-pro |

## pip

### 安裝

```zsh
brew install python # 安裝python（ pip ）
```

### 命令

```zsh
pip3 search 插件 # 搜尋某插件與其相關插件
pip3 list # 查詢已安裝插件清單
pip3 show pip # 查詢pip詳細資料
pip3 show 插件 # 查詢該插件詳細資料
pip3 install 插件 # 安裝該插件
pip3 install "插件<版本,>=版本" # 安裝該插件指定版本
pip3 uninstall 插件 # 解除安裝該插件
pip3 list --outdated # 表列過期插件
pip3 install -U pip # 升級pip
pip3 install -U 插件 # 升級該插件
pip3 check # 檢查插件版本相容性
```

### 插件

|    global    |
| :----------: |
| cmake_format |
|    cppman    |
|    flake8    |
|   ipython    |
|    isort     |
|     jedi     |
|    lizard    |
|    pipenv    |
|  pipdeptree  |
|   pwntools   |
|     yapf     |

## yarn

### 安裝

```zsh
brew install yarn # 安裝yarn
```

### 命令

```zsh
npm search 插件 # 搜尋某插件與其相關插件
yarn global list # 查詢全局已安裝插件清單
yarn global add 插件 # 在全局安裝該插件
yarn global remove 插件 # 在全局解除安裝該插件
yarn global upgrade # 在全局升級所有插件
yarn global upgrade 插件 # 在全局升級該插件
yarn add 插件 # 在區域安裝該插件
yarn remove 插件 # 在區域解除安裝該插件
yarn upgrade # 在區域升級所有插件
yarn upgrade 插件 # 在區域升級該插件
yarn install # 用package.json安裝插件
yarn cache clean # 清理暫存檔
```

### 插件

|          global           |
| :-----------------------: |
|       browser-sync        |
|            del            |
|      firebase-tools       |
|           gulp            |
|      gulp-clean-css       |
|        gulp-concat        |
|     gulp-html-replace     |
|       gulp-htmlmin        |
|         gulp-sass         |
|        gulp-terser        |
|      gulp-typescript      |
|         htmlhint          |
|         prettier          |
|         stylelint         |
| stylelint-config-standard |
|        typescript         |

## go

### 命令

```
go get -u xxx
```

### 插件

|   go   |
| :----: |
| asmfmt |
| shfmt  |

## vim-plug

### 命令

```vim
:PlugStatus " 查詢插件安裝與載入狀態
:PlugUpgrade " 升級 vim-plug
:PlugUpdate " 升級所有插件
```

### 插件

|      瀏覽      |       編輯       |   補全    | 偵錯 |           排版            |           任務           |        環境         |
| :------------: | :--------------: | :-------: | :--: | :-----------------------: | :----------------------: | :-----------------: |
|  vim-quickui   | vim-visual-multi | coc.nvim  | ale  |      vim-autoformat       |   markdown-preview.vim   |    vim-polyglot     |
|   vim-rooter   |  nerdcommenter   | emmet-vim |      |         vim-isort         | mathjax-support-for-mkdp |     indentLine      |
|    LeaderF     |                  |           |      |     vim-markdown-toc      |         neoterm          |    lightline.vim    |
|    nerdtree    |                  |           |      | verilog_systemverilog.vim |                          | vim-sublime-monokai |
|     vista      |                  |           |      |                           |                          |                     |
| vim-gutentags  |                  |           |      |                           |                          |                     |
|   vim-cppman   |                  |           |      |                           |                          |                     |
| vim-easymotion |                  |           |      |                           |                          |                     |
|  vim-signify   |                  |           |      |                           |                          |                     |

## coc

### 命令

```vim
:CocList extensions
:CocInstall
:CocUninstall
:CocUpdate
:CocConfig
```

### 插件

|      coc      |
| :-----------: |
|   coc-yaml    |
| coc-tsserver  |
| coc-sourcekit |
|    coc-sh     |
|  coc-python   |
| coc-omnisharp |
|   coc-json    |
|   coc-html    |
|  coc-docker   |
|    coc-css    |
|   coc-cmake   |
|  coc-clangd   |
