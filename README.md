# macOS

<!-- vim-markdown-toc GFM -->

+ [1. 快速安裝](#1-快速安裝)
+ [2. 手動配置](#2-手動配置)
    * [2.1. 系統環境](#21-系統環境)
        - [2.1.1. xcode](#211-xcode)
        - [2.1.2. brew](#212-brew)
            + [cellar](#cellar)
            + [cask](#cask)
            + [font](#font)
        - [2.1.3. pip](#213-pip)
            + [global](#global)
        - [2.1.4. yarn](#214-yarn)
            + [global](#global-1)
    * [2.2. 終端環境](#22-終端環境)
        - [2.2.1. iterm2](#221-iterm2)
        - [2.2.2. tmux](#222-tmux)
        - [2.2.3. zsh](#223-zsh)
    * [2.3. 編程環境](#23-編程環境)
        - [2.3.1. vim](#231-vim)
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
        - [2.3.5. markdown](#235-markdown)
            + [配置](#配置-4)
            + [映射](#映射-4)
        - [2.3.6. verilog](#236-verilog)
            + [配置](#配置-5)
            + [映射](#映射-5)
        - [2.3.7. x86_64](#237-x86_64)
        - [2.3.8. shell](#238-shell)

<!-- vim-markdown-toc -->

---

# 1. 快速安裝

```zsh
xcode-select --install
```

```zsh
git clone https://github.com/misakisuna705/Vimsual_Studio.git ~/.dotfiles
```

```zsh
chsh -s /bin/zsh
```

```zsh
sh ~/.dotfiles/src/setup.sh
```

# 2. 手動配置

## 2.1. 系統環境

### 2.1.1. xcode

```zsh
xcode-select --install # 安裝Command Line Tools for Xcode
```

### 2.1.2. brew

-   [詳情按此](doc/md/system/brew.md)

#### cellar

|     cellar      |
| :-------------: |
|     allegro     |
|     antigen     |
|     astyle      |
|      cmake      |
|    cppcheck     |
|       gdb       |
|     global      |
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

#### cask

|           cask           |
| :----------------------: |
|        1password         |
|        appcleaner        |
|         calibre          |
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
|        wireshark         |
|         xquartz          |

#### font

|         font         |
| :------------------: |
| font-source-code-pro |

---

### 2.1.3. pip

-   [詳情按此](doc/md/system/pip.md)

#### global

| global  |
| :-----: |
| cppman  |
| flake8  |
| ipython |
|  isort  |
|  jedi   |
| lizard  |
| pipenv  |
|  yapf   |

### 2.1.4. yarn

-   [詳情按此](doc/md/system/yarn.md)

#### global

|          global           |
| :-----------------------: |
|       browser-sync        |
|  browser-sync-close-hook  |
|            del            |
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
|   typescript-formatter    |

## 2.2. 終端環境

### 2.2.1. iterm2

-   [詳情按此](doc/md/terminal/iterm.md)

| iterm |                 |
| :---: | :-------------: |
| 字型  | Source Code Pro |
| 主題  |     Monokai     |
| 背景  |     iCloud      |

### 2.2.2. tmux

-   [詳情按此](doc/md/terminal/tmux.md)

### 2.2.3. zsh

-   [詳情按此](doc/md/terminal/zsh.md)

|         antigen         |
| :---------------------: |
|          pure           |
| zsh-syntax-highlighting |

## 2.3. 編程環境

|   [vim](#3.1)    | 環境 | 補全 | 偵錯 | 標籤 | 排版 | 編譯 / 執行 / 推播 | 調試 | 發佈 |
| :--------------: | :--: | :--: | :--: | :--: | :--: | :----------------: | :--: | :--: |
| [c / c++](#3.2)  |  x   |  o   |  o   |  o   |  o   |         o          |  o   |  o   |
|  [python](#3.3)  |  o   |  o   |  o   |  x   |  o   |         o          |  x   |  o   |
| [webpage](#3.4)  |  o   |  o   |  o   |  x   |  o   |         o          |  x   |  o   |
| [markdown](#3.5) |  x   |  x   |  x   |  x   |  o   |         o          |  x   |  o   |
| [verilog](#3.6)  |  o   |  o   |  o   |  x   |  x   |         o          |  x   |  o   |
|  [x86_64](#3.7)  |  x   |  x   |  x   |  x   |  x   |         x          |  x   |  x   |

---

### 2.3.1. vim

-   [詳情按此](doc/md/program/vim.md)

#### 配置

| vim  |         環境         |       檔案        |         文字         |
| :--: | :------------------: | :---------------: | :------------------: |
| 插件 |      indentLine      |     nerdtree      |    vim-easymotion    |
|      | vim-sublime-monokai  | NERD-tree-project | vim-multiple-cursors |
|      |    lightline.vim     |      LeaderF      |    nerdcommenter     |
|      | lightline-bufferline |                   |                      |

#### 映射

| vim  |        按鍵         |               功能                |
| :--: | :-----------------: | :-------------------------------: |
| 視窗 | `SPACE`+`q`+`ENTER` |             關閉 vim              |
|      | `SPACE`+`q`+`ENTER` |            關閉緩衝區             |
|      |         `n`         |          移至左邊緩衝區           |
|      |         `m`         |          移至右邊緩衝區           |
|      |     `CTRL`+`j`      |         游標移至左方視窗          |
|      |     `CTRL`+`l`      |         游標移至右方視窗          |
|      |     `CTRL`+`i`      |         游標移至上方視窗          |
|      |     `CTRL`+`k`      |         游標移至下方視窗          |
| 模式 |         `a`         | 從命令模式 / 終端模式進入插入模式 |
|      |         `;`         | 從命令模式進入插入模式並遞進一格  |
|      |       `k`+`j`       | 從插入模式回到命令模式 / 終端模式 |
| 檔案 |     `CTRL`+`n`      |        切換檔案總管與標籤         |
|      |     `CTRL`+`p`      |           搜尋文件開關            |
|      |     `CTRL`+`o`      |        在垂直分屏開啟檔案         |
| 標籤 |     `CTRL`+`n`      |        切換檔案總管與標籤         |
|      |     `CTRL`+`f`      |           搜尋標籤開關            |
| 文字 |         `s`         |            關鍵字跳轉             |
| 游標 |         `j`         |             游標左移              |
|      |         `l`         |             游標右移              |
|      |         `i`         |             游標上移              |
|      |         `k`         |             游標下移              |
|      |     `SHIFT`+`j`     |           游標高速左移            |
|      |     `SHIFT`+`l`     |           游標高速右移            |
|      |     `SHIFT`+`i`     |           游標高速上移            |
|      |     `SHIFT`+`k`     |           游標高速下移            |
| 編輯 |       `ENTER`       |          向下插入空白行           |
|      |     `{`+`ENTER`     |        自動換行縮進補全`}`        |
|      |     `SHIFT`+`a`     |          啟動多光標引擎           |
|      |         `a`         |        進入多光標插入模式         |
|      |       `/`+`/`       |          插入 / 移除註解          |
|      |     `SHIFT`+`u`     |          重做上一個動作           |

### 2.3.2. cpp

-   [詳情按此](doc/md/program/c_cpp.md)

#### 配置

| c / c++ | 環境 |     補全      |   偵錯   |       標籤        |      排版      |     編譯     |  執行   |   調試    |     發佈     |
| :-----: | :--: | :-----------: | :------: | :---------------: | :------------: | :----------: | :-----: | :-------: | :----------: |
|  依賴   |  x   |     clang     |  clang   |  universal-ctags  |     astyle     |    clang     |    x    |    gdb    |     git      |
|         |  x   |     cmake     | cppcheck |      cppman       |       x        |    ninja     |    x    |     x     |      x       |
|         |  x   |       x       |    x     |         x         |       x        |    cmake     |    x    |     x     |      x       |
|  插件   |  x   | YouCompleteMe |   ale    |   vim-gutentags   | vim-autoformat | asyncrun.vim | neoterm | termdebug | vim-signify  |
|         |  x   | YCM-Generator |    x     |    vim-preview    |       x        |      x       |    x    |     x     | asyncrun.vim |
|         |  x   |       x       |    x     | split-manpage.vim |       x        |      x       |    x    |     x     |      x       |
|         |  x   |       x       |    x     |    vim-cppman     |       x        |      x       |    x    |     x     |      x       |

#### 映射

| c / c++ |        按鍵         |         功能          |
| :-----: | :-----------------: | :-------------------: |
|  手冊   |         `q`         |  垂直分屏後開關 man   |
|         |         `q`         | 垂直分屏後開關 cppman |
|  預覽   |     `SHIFT`+`m`     |  在垂直分屏預覽標籤   |
|         |     `SHIFT`+`n`     |    跳轉至選定標籤     |
|         |     `SHIFT`+`h`     |     關閉預覽視窗      |
|  跳轉   |         `f`         |     偵錯訊息跳轉      |
|         |     `shift`+`f`     |     版本訊息跳轉      |
|  編程   |        `F1`         |      編譯發行版       |
|         |        `F2`         |         執行          |
|         |        `F3`         |      編譯開發版       |
|         |        `F4`         |         除錯          |
|         |        `F5`         |       設置斷點        |
|         |        `F6`         |       清除斷點        |
|         |        `F7`         |       執行調試        |
|         |        `F8`         |       繼續調試        |
|         |        `F9`         |       單步繼續        |
|         |        `F10`        |       單步進入        |
|         |        `F11`        |         發佈          |
|  終端   |        `F12`        | 切換終端機與 quickfix |
|         | `SPACE`+`q`+`ENTER` |      關閉終端機       |

### 2.3.3. python

-   [詳情按此](doc/md/program/python.md)

#### 配置

| python |  環境  |     補全      |  偵錯  | 標籤 |      排版      |  直譯   | 調試 |     發佈     |
| :----: | :----: | :-----------: | :----: | :--: | :------------: | :-----: | :--: | :----------: |
|  依賴  | pipenv |     jedi      | flake8 |  x   |      yapf      | ipython |  x   |     git      |
|        |   x    |       x       |   x    |  x   |     isort      |    x    |  x   |      x       |
|  插件  |   x    | YouCompleteMe |  ale   |  x   | vim-autoformat | neoterm |  x   | vim-signify  |
|        |   x    |       x       |   x    |  x   |   vim-isort    |    x    |  x   | asyncrun.vim |

#### 映射

| python |        按鍵         |         功能          |
| :----: | :-----------------: | :-------------------: |
|  跳轉  |         `f`         |     偵錯訊息跳轉      |
|        |     `shift`+`f`     |     版本訊息跳轉      |
|  編程  |        `F1`         |       單行直譯        |
|        |        `F2`         |       多行直譯        |
|        |        `F3`         |       文件直譯        |
|        |        `F11`        |         發佈          |
|  終端  |        `F12`        | 切換終端機與 quickfix |
|        | `SPACE`+`q`+`ENTER` |      關閉終端機       |

### 2.3.4. webpage

-   [詳情按此](doc/md/program/webpage.md)

#### 配置

| webpage |    環境    |   補全    |           偵錯            | 標籤 |         排版         |          推播           | 調試 |     發佈     |
| :-----: | :--------: | :-------: | :-----------------------: | :--: | :------------------: | :---------------------: | :--: | :----------: |
|  依賴   |    yarn    |     x     |         htmlhint          |  x   |       prettier       |           del           |  x   |     git      |
|         | typescript |     x     |         stylelint         |  x   | typescript-formatter |          gulp           |  x   |      x       |
|         |     x      |     x     | stylelint-config-standard |  x   |          x           |    gulp-html-replace    |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |      gulp-htmlmin       |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |        gulp-sass        |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |     gulp-clean-css      |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |     gulp-typescript     |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |       gulp-terser       |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |       gulp-concat       |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           |      browser-sync       |  x   |      x       |
|         |     x      |     x     |             x             |  x   |          x           | browser-sync-close-hook |  x   |      x       |
|  插件   |     x      | coc.nvim  |            ale            |  x   |    vim-autoformat    |         neoterm         |  x   | vim-signify  |
|         |     x      | emmet-vim |             x             |  x   |          x           |            x            |  x   | asyncrun.vim |

#### 映射

| webpage |        按鍵         |         功能          |
| :-----: | :-----------------: | :-------------------: |
|  編輯   |   `CTRL`+`z`+`,`    |       補全標籤        |
|  跳轉   |         `f`         |     偵錯訊息跳轉      |
|         |     `shift`+`f`     |     版本訊息跳轉      |
|  編程   |        `F1`         |       開始推播        |
|         |        `F2`         |       停止推播        |
|         |        `F11`        |         發佈          |
|  終端   |        `F12`        | 切換終端機與 quickfix |
|         | `SPACE`+`q`+`ENTER` |      關閉終端機       |

### 2.3.5. markdown

-   [詳情按此](doc/md/program/markdown.md)

#### 配置

| markdown | 環境 |       補全       | 偵錯 | 標籤 |      排版      |           推播           | 調試 |     發佈     |
| :------: | :--: | :--------------: | :--: | :--: | :------------: | :----------------------: | :--: | :----------: |
|   依賴   |  x   |        x         |  x   |  x   |    prettier    |            x             |  x   |     git      |
|   插件   |  x   | vim-markdown-toc |  x   |  x   | vim-autoformat |     markdown-preview     |  x   | vim-signify  |
|          |  x   |        x         |  x   |  x   |       x        | mathjax-support-for-mkdp |  x   | asyncrun.vim |

#### 映射

| markdown |        按鍵         |         功能          |
| :------: | :-----------------: | :-------------------: |
|   跳轉   |         `f`         |     偵錯訊息跳轉      |
|          |     `shift`+`f`     |     版本訊息跳轉      |
|   編程   |        `F1`         |       開始推播        |
|          |        `F2`         |       停止推播        |
|          |        `F3`         |       生成目錄        |
|          |        `F4`         |       刪去目錄        |
|          |        `F11`        |         發佈          |
|   終端   |        `F12`        | 切換終端機與 quickfix |
|          | `SPACE`+`q`+`ENTER` |      關閉終端機       |

### 2.3.6. verilog

-   [詳情按此](doc/md/program/verilog.md)

#### 配置

| verilog |   環境   |     補全      | 偵錯 | 標籤 |           排版            |     編譯     |  執行   |  推播   | 調試 |     發佈     |
| :-----: | :------: | :-----------: | :--: | :--: | :-----------------------: | :----------: | :-----: | :-----: | :--: | :----------: |
|  依賴   | iverilog |       x       |  x   |  x   |             x             |      x       |    x    | xquartz |  x   |     git      |
|         |    x     |       x       |  x   |  x   |             x             |      x       |    x    | gtkwave |  x   |      x       |
|  插件   |    x     | YouCompleteMe | ale  |  x   | verilog_systemverilog.vim | asyncrun.vim | neoterm | neoterm |  x   | vim-signify  |
|         |    x     |       x       |  x   |  x   |             x             |      x       |    x    |    x    |  x   | asyncrun.vim |

#### 映射

| verilog |        按鍵         |         功能          |
| :-----: | :-----------------: | :-------------------: |
|  跳轉   |         `f`         |     偵錯訊息跳轉      |
|         |     `shift`+`f`     |     版本訊息跳轉      |
|  編程   |        `F1`         |         編譯          |
|         |        `F2`         |         執行          |
|         |        `F3`         |         推播          |
|         |        `F11`        |         發佈          |
|  終端   |        `F12`        | 切換終端機與 quickfix |
|         | `SPACE`+`q`+`ENTER` |      關閉終端機       |

### 2.3.7. x86_64

### 2.3.8. shell

shellcheck

Plug 'w0rp/ale',{'for':['sh']}
