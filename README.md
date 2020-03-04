# macOS / linux

<!-- vim-markdown-toc GFM -->

+ [快速安裝](#快速安裝)
    * [git](#git)
    * [docker](#docker)
+ [手動配置](#手動配置)
    * [系統環境](#系統環境)
        - [macOS](#macos)
            + [xcode](#xcode)
            + [brew](#brew)
                * [cellar](#cellar)
                * [cask](#cask)
                * [font](#font)
            + [pip](#pip)
                * [global](#global)
            + [yarn](#yarn)
                * [global](#global-1)
        - [linux](#linux)
            + [docker](#docker-1)
            + [apt](#apt)
                * [VM](#vm)
                * [WSL](#wsl)
            + [brew](#brew-1)
                * [cellar](#cellar-1)
    * [終端環境](#終端環境)
        - [iterm2](#iterm2)
        - [tmux](#tmux)
        - [zsh](#zsh)
    * [編程環境](#編程環境)
        - [vim](#vim)
            + [配置](#配置)
            + [映射](#映射)
        - [2.3.2. cpp](#232-cpp)
            + [配置](#配置-1)
            + [映射](#映射-1)
        - [2.3.3. python](#233-python)
            + [配置](#配置-2)
            + [映射](#映射-2)
        - [2.3.4. webpage](#234-webpage)
            + [配置](#配置-3)
            + [映射](#映射-3)
        - [2.3.5. csharp](#235-csharp)
            + [配置](#配置-4)
            + [映射](#映射-4)
        - [2.3.6. markdown](#236-markdown)
            + [配置](#配置-5)
            + [映射](#映射-5)
        - [2.3.7. verilog](#237-verilog)
            + [配置](#配置-6)
            + [映射](#映射-6)
        - [2.3.8. assembly](#238-assembly)
            + [配置](#配置-7)
        - [2.3.9. shell](#239-shell)
        - [2.4.0. ios](#240-ios)

<!-- vim-markdown-toc -->

---

# 快速安裝

## git

```zsh
git clone https://github.com/misakisuna705/Vimsual_Studio.git ~/.dotfiles

~/.dotfiles/setup.sh
```

## docker

```zsh
docker pull misakisuna705/vimsual-studio
```

# 手動配置

## 系統環境

### macOS

#### xcode

```zsh
xcode-select --install # 安裝Command Line Tools for Xcode
```

#### brew

-   [詳情按此](doc/md/system/brew.md)

##### cellar

|     cellar      |
| :-------------: |
|     allegro     |
|     antigen     |
|     astyle      |
|      cmake      |
|    cppcheck     |
|       gdb       |
|       go        |
| icarus-verilog  |
|      nasm       |
|      ninja      |
|     python      |
|     ripgrep     |
|   shellcheck    |
|      sshfs      |
|      tmux       |
| universal-ctags |
|       vim       |
|      wget       |
|      yarn       |

##### cask

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
|          mipony          |
|         osxfuse          |
|         tickeys          |
|       transmission       |
|        unity-hub         |
|        wireshark         |
|         xquartz          |

##### font

|         font         |
| :------------------: |
| font-source-code-pro |

#### pip

-   [詳情按此](doc/md/system/pip.md)

##### global

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
|     yapf     |

#### yarn

-   [詳情按此](doc/md/system/yarn.md)

##### global

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

### linux

#### docker

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
docker rmi -v 映像 # 解除安裝該映像與對應儲區

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

#### apt

-   [詳情按此](doc/md/system/apt.md)

##### VM

|      package      |
| :---------------: |
| chromium-browser  |
|       hime        |
| linuxbrew-wrapper |
|  xfce4-terminal   |
|        zsh        |

##### WSL

|      package      |
| :---------------: |
| linuxbrew-wrapper |
|        zsh        |

#### brew

-   [詳情按此](doc/md/system/brew.md)

##### cellar

|     cellar      |
| :-------------: |
|     antigen     |
|     astyle      |
|      cmake      |
|    cppcheck     |
|       gdb       |
| icarus-verilog  |
|      llvm       |
|      nasm       |
|      ninja      |
|     python      |
|     ripgrep     |
|   shellcheck    |
|      sshfs      |
|      tmux       |
| universal-ctags |
|       vim       |
|      yarn       |

## 終端環境

### iterm2

-   [詳情按此](doc/md/terminal/iterm.md)

| iterm |                 |
| :---: | :-------------: |
| 字型  | Source Code Pro |
| 主題  |     Monokai     |
| 背景  |     iCloud      |

### tmux

-   [詳情按此](doc/md/terminal/tmux.md)

### zsh

-   [詳情按此](doc/md/terminal/zsh.md)

|         antigen         |
| :---------------------: |
|          pure           |
| zsh-syntax-highlighting |
|   zsh-autosuggestions   |

## 編程環境

|   [vim](#3.1)    | 環境 | 補全 | 偵錯 | 標籤 | 排版 | 編譯 / 執行 / 推播 | 調試 | 發佈 |
| :--------------: | :--: | :--: | :--: | :--: | :--: | :----------------: | :--: | :--: |
| [c / c++](#3.2)  |  x   |  o   |  o   |  o   |  o   |         o          |  o   |  o   |
|  [python](#3.3)  |  o   |  o   |  o   |  x   |  o   |         o          |  x   |  o   |
| [webpage](#3.4)  |  o   |  o   |  o   |  x   |  o   |         o          |  x   |  o   |
| [markdown](#3.5) |  x   |  x   |  x   |  x   |  o   |         o          |  x   |  o   |
| [verilog](#3.6)  |  o   |  o   |  o   |  x   |  x   |         o          |  x   |  o   |
|   [asm](#3.7)    |  x   |  x   |  x   |  x   |  o   |         x          |  x   |  x   |

---

### vim

-   [詳情按此](doc/md/program/vim.md)

#### 配置

| vim  |      瀏覽      |       編輯       |     補全      | 偵錯 |           排版            |           任務           |        環境         |
| :--: | :------------: | :--------------: | :-----------: | :--: | :-----------------------: | :----------------------: | :-----------------: |
| 插件 |   vim-rooter   | vim-visual-multi | YouCompleteMe | ale  |      vim-autoformat       |       vim-quickui        |    vim-polyglot     |
|      |    LeaderF     |  nerdcommenter   | YCM-Generator |      |         vim-isort         |   markdown-preview.vim   |     indentLine      |
|      |    nerdtree    |                  |   coc.nvim    |      |     vim-markdown-toc      | mathjax-support-for-mkdp |    lightline.vim    |
|      |     vista      |                  |   emmet-vim   |      | verilog_systemverilog.vim |         neoterm          | vim-sublime-monokai |
|      |  vim-preview   |                  |               |      |                           |                          |                     |
|      | vim-gutentags  |                  |               |      |                           |                          |                     |
|      |   vim-cppman   |                  |               |      |                           |                          |                     |
|      | vim-easymotion |                  |               |      |                           |                          |                     |
|      |  vim-signify   |                  |               |      |                           |                          |                     |

#### 映射

| vim  |        按鍵         |               功能                |
| :--: | :-----------------: | :-------------------------------: |
| 模式 |         `a`         | 從命令模式 / 終端模式進入插入模式 |
|      |         `;`         | 從命令模式進入插入模式並遞進一格  |
|      |       `k`+`j`       | 從插入模式回到命令模式 / 終端模式 |
| 視窗 | `SPACE`+`q`+`ENTER` |             關閉 vim              |
|      | `SPACE`+`q`+`ENTER` |            關閉終端機             |
|      | `SPACE`+`q`+`ENTER` |            關閉標籤頁             |
|      |         `n`         |           移至左標籤頁            |
|      |         `m`         |           移至右標籤頁            |
|      |     `CTRL`+`j`      |         游標移至左方視窗          |
|      |     `CTRL`+`l`      |         游標移至右方視窗          |
|      |     `CTRL`+`i`      |         游標移至上方視窗          |
|      |     `CTRL`+`k`      |         游標移至下方視窗          |
| 游標 |         `j`         |             游標左移              |
|      |         `l`         |             游標右移              |
|      |         `i`         |             游標上移              |
|      |         `k`         |             游標下移              |
|      |     `SHIFT`+`j`     |           游標高速左移            |
|      |     `SHIFT`+`l`     |           游標高速右移            |
|      |     `SHIFT`+`i`     |           游標高速上移            |
|      |     `SHIFT`+`k`     |           游標高速下移            |
| 瀏覽 |     `CTRL`+`n`      |        切換檔案總管與標籤         |
|      |     `CTRL`+`p`      |           搜尋文件開關            |
|      |     `CTRL`+`f`      |           搜尋標籤開關            |
|      |     `CTRL`+`o`      |        在垂直分屏開啟檔案         |
|      |     `SHIFT`+`m`     |        在垂直分屏預覽標籤         |
|      |     `SHIFT`+`n`     |          跳轉至選定標籤           |
|      |     `SHIFT`+`h`     |           關閉預覽視窗            |
|      |         `q`         |        垂直分屏後開關 man         |
|      |         `q`         |       垂直分屏後開關 cppman       |
|      |         `s`         |            關鍵字跳轉             |
|      |         `f`         |           偵錯訊息跳轉            |
|      |     `shift`+`f`     |           版本訊息跳轉            |
| 編輯 |       `ENTER`       |          向下插入空白行           |
|      |     `{`+`ENTER`     |        自動換行縮進補全`}`        |
|      |     `SHIFT`+`a`     |          啟動多光標引擎           |
|      |         `a`         |        進入多光標插入模式         |
|      |       `/`+`/`       |          插入 / 移除註解          |
|      |     `SHIFT`+`u`     |          重做上一個動作           |
|      | `SPACE`+`e`+`ENTER` |             自動排版              |

### 2.3.2. cpp

-   [詳情按此](doc/md/program/c_cpp.md)

#### 配置

| c / c++ |     補全      |   偵錯   |      排版      |  編譯   |  執行   |   調試    |  發佈   |
| :-----: | :-----------: | :------: | :------------: | :-----: | :-----: | :-------: | :-----: |
|  依賴   |     clang     |  clang   |     astyle     |  clang  |    x    |    gdb    |   git   |
|         |     cmake     | cppcheck |  cmake_format  |  ninja  |    x    |     x     |    x    |
|         |       x       |    x     |       x        |  cmake  |    x    |     x     |    x    |
|  插件   | YouCompleteMe |   ale    | vim-autoformat | neoterm | neoterm | termdebug | neoterm |
|         | YCM-Generator |    x     |       x        |    x    |    x    |     x     |    x    |

#### 映射

| c / c++ | 按鍵  |    功能    |
| :-----: | :---: | :--------: |
|  編程   | `F1`  | 編譯發行版 |
|         | `F2`  |    執行    |
|         | `F3`  | 編譯開發版 |
|         | `F4`  |    除錯    |
|         | `F5`  |  設置斷點  |
|         | `F6`  |  清除斷點  |
|         | `F7`  |  執行調試  |
|         | `F8`  |  繼續調試  |
|         | `F9`  |  單步繼續  |
|         | `F10` |  單步進入  |
|         | `F12` |    發佈    |

### 2.3.3. python

-   [詳情按此](doc/md/program/python.md)

#### 配置

| python |  環境  |     補全      |  偵錯  |      排版      |  直譯   |  發佈   |
| :----: | :----: | :-----------: | :----: | :------------: | :-----: | :-----: |
|  依賴  | pipenv |     jedi      | flake8 |      yapf      | ipython |   git   |
|        |   x    |       x       |   x    |     isort      |    x    |    x    |
|  插件  |   x    | YouCompleteMe |  ale   | vim-autoformat | neoterm | neoterm |
|        |   x    |       x       |   x    |   vim-isort    |    x    |    x    |

#### 映射

| python | 按鍵  |   功能   |
| :----: | :---: | :------: |
|  編程  | `F1`  | 單行直譯 |
|        | `F2`  | 多行直譯 |
|        | `F3`  | 文件直譯 |
|        | `F12` |   發佈   |

### 2.3.4. webpage

-   [詳情按此](doc/md/program/webpage.md)

#### 配置

| webpage |    環境    |   補全    |           偵錯            |      排版      |       推播        | 調試 |  發佈   |
| :-----: | :--------: | :-------: | :-----------------------: | :------------: | :---------------: | :--: | :-----: |
|  依賴   |    yarn    |     x     |         htmlhint          |    prettier    |        del        |  x   |   git   |
|         | typescript |     x     |         stylelint         |       x        |       gulp        |  x   |    x    |
|         |     x      |     x     | stylelint-config-standard |       x        | gulp-html-replace |  x   |    x    |
|         |     x      |     x     |             x             |       x        |   gulp-htmlmin    |  x   |    x    |
|         |     x      |     x     |             x             |       x        |     gulp-sass     |  x   |    x    |
|         |     x      |     x     |             x             |       x        |  gulp-clean-css   |  x   |    x    |
|         |     x      |     x     |             x             |       x        |  gulp-typescript  |  x   |    x    |
|         |     x      |     x     |             x             |       x        |    gulp-terser    |  x   |    x    |
|         |     x      |     x     |             x             |       x        |    gulp-concat    |  x   |    x    |
|         |     x      |     x     |             x             |       x        |   browser-sync    |  x   |    x    |
|  插件   |     x      | coc.nvim  |            ale            | vim-autoformat |      neoterm      |  x   | neoterm |
|         |     x      | emmet-vim |             x             |       x        |         x         |  x   |    x    |

#### 映射

| webpage |      按鍵      |   功能   |
| :-----: | :------------: | :------: |
|  編輯   | `CTRL`+`z`+`,` | 補全標籤 |
|  編程   |      `F1`      | 開始推播 |
|         |      `F2`      | 停止推播 |
|         |     `F12`      |   發佈   |

### 2.3.5. csharp

-   [詳情按此](doc/md/program/csharp.md)

#### 配置

| csharp |    環境    |   補全   | 偵錯 |      排版      |    編譯    |    執行    |  發佈   |
| :----: | :--------: | :------: | :--: | :------------: | :--------: | :--------: | :-----: |
|  依賴  | dotnet-sdk |    x     |  x   |     astyle     | dotnet-sdk | dotnet-sdk |   git   |
|  插件  |     x      | coc.nvim |  x   | vim-autoformat |  neoterm   |  neoterm   | neoterm |

#### 映射

| csharp | 按鍵  |   功能   |
| :----: | :---: | :------: |
|  編程  | `F1`  | 編譯執行 |
|        | `F12` |   發佈   |

### 2.3.6. markdown

-   [詳情按此](doc/md/program/markdown.md)

#### 配置

| markdown | 環境 |       補全       |      排版      |           推播           |  發佈   |
| :------: | :--: | :--------------: | :------------: | :----------------------: | :-----: |
|   依賴   |  x   |        x         |    prettier    |            x             |   git   |
|   插件   |  x   | vim-markdown-toc | vim-autoformat |     markdown-preview     | neoterm |
|          |  x   |        x         |       x        | mathjax-support-for-mkdp |    x    |

#### 映射

| markdown | 按鍵  |   功能   |
| :------: | :---: | :------: |
|   編程   | `F1`  | 開始推播 |
|          | `F2`  | 停止推播 |
|          | `F3`  | 生成目錄 |
|          | `F4`  | 刪去目錄 |
|          | `F12` |   發佈   |

### 2.3.7. verilog

-   [詳情按此](doc/md/program/verilog.md)

#### 配置

| verilog |   環境   |     補全      | 偵錯 |           排版            |  編譯   |  執行   |  調試   |  發佈   |
| :-----: | :------: | :-----------: | :--: | :-----------------------: | :-----: | :-----: | :-----: | :-----: |
|  依賴   | iverilog |       x       |  x   |             x             |    x    |    x    | xquartz |   git   |
|         |    x     |       x       |  x   |             x             |    x    |    x    | gtkwave |    x    |
|  插件   |    x     | YouCompleteMe | ale  | verilog_systemverilog.vim | neoterm | neoterm | neoterm | neoterm |

#### 映射

| verilog | 按鍵  | 功能 |
| :-----: | :---: | :--: |
|  編程   | `F1`  | 編譯 |
|         | `F2`  | 執行 |
|         | `F3`  | 推播 |
|         | `F12` | 發佈 |

### 2.3.8. assembly

-   [詳情按此](doc/md/program/assembly.md)

#### 配置

| assembly |      排版      |
| :------: | :------------: |
|   依賴   |       x        |
|   插件   | vim-autoformat |

### 2.3.9. shell

shellcheck

Plug 'w0rp/ale',{'for':['sh']}

shfmt

### 2.4.0. ios

coc-sourcekit
