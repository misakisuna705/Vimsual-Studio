# macOS / ubuntu

<!-- vim-markdown-toc GFM -->

+ [快速安裝](#快速安裝)
    * [macOS / Ubuntu](#macos--ubuntu)
    * [docker](#docker)
+ [手動配置](#手動配置)
    * [終端環境](#終端環境)
    * [依賴環境](#依賴環境)
    * [編程環境](#編程環境)
        - [vim](#vim)
            + [映射](#映射)
        - [cpp](#cpp)
            + [配置](#配置)
            + [映射](#映射-1)
        - [python](#python)
            + [配置](#配置-1)
            + [映射](#映射-2)
        - [webpage](#webpage)
            + [配置](#配置-2)
            + [映射](#映射-3)
        - [ios](#ios)
            + [配置](#配置-3)
        - [csharp](#csharp)
            + [配置](#配置-4)
            + [映射](#映射-4)
        - [markdown](#markdown)
            + [配置](#配置-5)
            + [映射](#映射-5)
        - [verilog](#verilog)
            + [配置](#配置-6)
            + [映射](#映射-6)
        - [assembly](#assembly)
            + [配置](#配置-7)
        - [shell](#shell)
            + [配置](#配置-8)
        - [cmake](#cmake)
            + [配置](#配置-9)
        - [docker](#docker-1)
            + [配置](#配置-10)

<!-- vim-markdown-toc -->

---

# 快速安裝

## macOS / Ubuntu

```zsh
git clone https://github.com/misakisuna705/Vimsual_Studio.git ~/.dotfiles

~/.dotfiles/setup.sh
```

## docker

```zsh
docker pull misakisuna705/vimsual-studio
```

# 手動配置

## 終端環境

-   [詳情按此](doc/md/terminal.md)

## 依賴環境

-   [詳情按此](doc/md/package.md)

## 編程環境

-   [詳情按此](doc/md/vim.md)

### vim

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
|      |     `SHIFT`+`m`     |         循環預覽函數定義          |
|      |     `SHIFT`+`n`     |         向下滾動預覽視窗          |
|      |     `SHIFT`+`h`     |         向上滾動預覽視窗          |
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

### cpp

#### 配置

| c / c++ |   補全   |   偵錯   |      排版      |  編譯   |  執行   |   調試    |  發佈   |
| :-----: | :------: | :------: | :------------: | :-----: | :-----: | :-------: | :-----: |
|  依賴   |   llvm   |   llvm   |     astyle     |  llvm   |    x    |    gdb    |   git   |
|         |    x     | cppcheck |       x        |  ninja  |    x    |     x     |    x    |
|         |    x     |    x     |       x        |  cmake  |    x    |     x     |    x    |
|  插件   | coc.nvim |   ale    | vim-autoformat | neoterm | neoterm | termdebug | neoterm |

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

### python

#### 配置

| python |  環境  |   補全   |  偵錯  |      排版      |  直譯   |  發佈   |
| :----: | :----: | :------: | :----: | :------------: | :-----: | :-----: |
|  依賴  | pipenv |   jedi   | flake8 |      yapf      | ipython |   git   |
|        |   x    |    x     |   x    |     isort      |    x    |    x    |
|  插件  |   x    | coc.nvim |  ale   | vim-autoformat | neoterm | neoterm |
|        |   x    |    x     |   x    |   vim-isort    |    x    |    x    |

#### 映射

| python | 按鍵  |   功能   |
| :----: | :---: | :------: |
|  編程  | `F1`  | 單行直譯 |
|        | `F2`  | 多行直譯 |
|        | `F3`  | 文件直譯 |
|        | `F12` |   發佈   |

### webpage

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

### ios

#### 配置

| ios  | 環境  |   補全   |   偵錯    |      排版      | 編譯 | 執行 | 調試 |  發佈   |
| :--: | :---: | :------: | :-------: | :------------: | :--: | :--: | :--: | :-----: |
| 依賴 | xcode |   llvm   | swiftlint |  swiftformat   |  x   |  x   |  x   |   git   |
| 依賴 |   x   |    x     |     x     |       x        |  x   |  x   |  x   |    x    |
| 插件 |   x   | coc.nvim |    ale    | vim-autoformat |  x   |  x   |  x   | neoterm |

### csharp

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

### markdown

#### 配置

| markdown | 環境 |       補全       |      排版      |           推播           |  發佈   |
| :------: | :--: | :--------------: | :------------: | :----------------------: | :-----: |
|   依賴   |  x   |        x         |    prettier    |            x             |   git   |
|   插件   |  x   | vim-markdown-toc | vim-autoformat |     markdown-preview     | neoterm |
|          |  x   |     coc.nvim     |       x        | mathjax-support-for-mkdp |    x    |

#### 映射

| markdown | 按鍵  |   功能   |
| :------: | :---: | :------: |
|   編程   | `F1`  | 開始推播 |
|          | `F2`  | 停止推播 |
|          | `F3`  | 生成目錄 |
|          | `F4`  | 刪去目錄 |
|          | `F12` |   發佈   |

### verilog

#### 配置

| verilog |   環境   |   補全   | 偵錯 |           排版            |  編譯   |  執行   |  調試   |  發佈   |
| :-----: | :------: | :------: | :--: | :-----------------------: | :-----: | :-----: | :-----: | :-----: |
|  依賴   | iverilog |    x     |  x   |             x             |    x    |    x    | xquartz |   git   |
|         |    x     |    x     |  x   |             x             |    x    |    x    | gtkwave |    x    |
|  插件   |    x     | coc.nvim | ale  | verilog_systemverilog.vim | neoterm | neoterm | neoterm | neoterm |

#### 映射

| verilog | 按鍵  | 功能 |
| :-----: | :---: | :--: |
|  編程   | `F1`  | 編譯 |
|         | `F2`  | 執行 |
|         | `F3`  | 推播 |
|         | `F12` | 發佈 |

### assembly

#### 配置

| assembly |      排版      |
| :------: | :------------: |
|   依賴   |     asmfmt     |
|   插件   | vim-autoformat |

### shell

#### 配置

| shell |   補全   |    偵錯    |      排版      |
| :---: | :------: | :--------: | :------------: |
| 依賴  |    x     | shellcheck |     shfmt      |
| 插件  | coc.nvim |    ale     | vim-autoformat |

### cmake

#### 配置

| cmake |   補全   |      排版      |
| :---: | :------: | :------------: |
| 依賴  |          |  cmake_format  |
| 插件  | coc.nvim | vim-autoformat |

### docker

#### 配置

| cmake |   補全   |
| :---: | :------: |
| 依賴  |          |
| 插件  | coc.nvim |
