# vim

<!-- vim-markdown-toc GFM -->

* [gdb 8.0.1](#gdb-801)
    - [安裝](#安裝)
    - [命令](#命令)
* [pipenv](#pipenv)
    - [設定](#設定)
    - [命令](#命令-1)
* [yarn](#yarn)
* [typescript](#typescript)
* [gulp](#gulp)
* [dotnet-sdk](#dotnet-sdk)
* [ale](#ale)
* [cpp](#cpp)
* [python](#python)
* [ios](#ios)
* [web](#web)
* [csharp](#csharp)
* [markdown](#markdown)
* [verilog](#verilog)
* [assembly](#assembly)
* [bash](#bash)
* [cmake](#cmake)
* [docker](#docker)

<!-- vim-markdown-toc -->

---

## gdb 8.0.1

### 安裝

```zsh
brew unlink gdb
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/9ec9fb27a33698fc7636afce5c1c16787e9ce3f3/Formula/gdb.rb
```

### 命令

```zsh
b 行數       # 在main.c某行設置斷點
b xxx.c:行數 # 在xxx.c某行設置斷點
r            # 開始調試
c            # 繼續調試
n            # 單步繼續
s            # 單步進入
p 變數       # 印變數存值
p &變數      # 印變數位址
```

## pipenv

### 設定

```zsh
export PIPENV_VENV_IN_PROJECT=1
```

### 命令

```zsh
pipenv install # 在該專案初始化虛擬環境
pipenv graph # 查詢虛擬環境已安裝插件清單
pipenv --rm # 在該專案卸載虛擬環境
pipenv install 插件 # 在虛擬環境安裝該插件
pipenv uninstall 插件 # 在虛擬環境解除安裝該插件
pipenv shell # 載入虛擬環境
pipenv run 命令 # 在虛擬環境中執行命令
```

## yarn

```zsh
yarn init # 該專案初始化環境
```

## typescript

```zsh
tsc xxx.ts
```

## gulp

```zsh
gulp # 將web推播到瀏覽器
```

## dotnet-sdk

```zsh
dotnet new console # 初始化專案環境
dotnet run # 編譯並執行該專案
```

## ale

```vim
:ALEInfo " 查詢ale支援的linter
:ALEDetail " debug ale
```

## cpp

| c / c++ |   補全   |   偵錯   |      排版      |  編譯   |  執行   |   調試    |  發佈   |
| :-----: | :------: | :------: | :------------: | :-----: | :-----: | :-------: | :-----: |
|  依賴   |   llvm   |   llvm   |     astyle     |  llvm   |    x    |    gdb    |   git   |
|         |    x     | cppcheck |       x        |  ninja  |    x    |     x     |    x    |
|         |    x     |    x     |       x        |  cmake  |    x    |     x     |    x    |
|  插件   | coc.nvim |   ale    | vim-autoformat | neoterm | neoterm | termdebug | neoterm |

## python

| python |  環境  |   補全   |  偵錯  |      排版      |  直譯   |  發佈   |
| :----: | :----: | :------: | :----: | :------------: | :-----: | :-----: |
|  依賴  | pipenv |   jedi   | flake8 |      yapf      | ipython |   git   |
|        |   x    |    x     |   x    |     isort      |    x    |    x    |
|  插件  |   x    | coc.nvim |  ale   | vim-autoformat | neoterm | neoterm |
|        |   x    |    x     |   x    |   vim-isort    |    x    |    x    |

## ios

| ios  | 環境  |   補全   |   偵錯    |      排版      | 編譯 | 執行 | 調試 |  發佈   |
| :--: | :---: | :------: | :-------: | :------------: | :--: | :--: | :--: | :-----: |
| 依賴 | xcode |   llvm   | swiftlint |  swiftformat   |  x   |  x   |  x   |   git   |
| 依賴 |   x   |    x     |     x     |       x        |  x   |  x   |  x   |    x    |
| 插件 |   x   | coc.nvim |    ale    | vim-autoformat |  x   |  x   |  x   | neoterm |

## web

| web  |    環境    |   補全    |           偵錯            |      排版      |       推播        | 調試 |  發佈   |
| :--: | :--------: | :-------: | :-----------------------: | :------------: | :---------------: | :--: | :-----: |
| 依賴 |    yarn    |     x     |         htmlhint          |    prettier    |        del        |  x   |   git   |
|      | typescript |     x     |         stylelint         |       x        |       gulp        |  x   |    x    |
|      |     x      |     x     | stylelint-config-standard |       x        | gulp-html-replace |  x   |    x    |
|      |     x      |     x     |             x             |       x        |   gulp-htmlmin    |  x   |    x    |
|      |     x      |     x     |             x             |       x        |     gulp-sass     |  x   |    x    |
|      |     x      |     x     |             x             |       x        |  gulp-clean-css   |  x   |    x    |
|      |     x      |     x     |             x             |       x        |  gulp-typescript  |  x   |    x    |
|      |     x      |     x     |             x             |       x        |    gulp-terser    |  x   |    x    |
|      |     x      |     x     |             x             |       x        |    gulp-concat    |  x   |    x    |
|      |     x      |     x     |             x             |       x        |   browser-sync    |  x   |    x    |
| 插件 |     x      | coc.nvim  |            ale            | vim-autoformat |      neoterm      |  x   | neoterm |
|      |     x      | emmet-vim |             x             |       x        |         x         |  x   |    x    |

## csharp

| csharp |    環境    |   補全   | 偵錯 |      排版      |    編譯    |    執行    |  發佈   |
| :----: | :--------: | :------: | :--: | :------------: | :--------: | :--------: | :-----: |
|  依賴  | dotnet-sdk |    x     |  x   |     astyle     | dotnet-sdk | dotnet-sdk |   git   |
|  插件  |     x      | coc.nvim |  x   | vim-autoformat |  neoterm   |  neoterm   | neoterm |

## markdown

| markdown | 環境 |       補全       |      排版      |           推播           |  發佈   |
| :------: | :--: | :--------------: | :------------: | :----------------------: | :-----: |
|   依賴   |  x   |        x         |    prettier    |            x             |   git   |
|   插件   |  x   | vim-markdown-toc | vim-autoformat |     markdown-preview     | neoterm |
|          |  x   |     coc.nvim     |       x        | mathjax-support-for-mkdp |    x    |

## verilog

| verilog |   環境   |   補全   | 偵錯 |           排版            |  編譯   |  執行   |  調試   |  發佈   |
| :-----: | :------: | :------: | :--: | :-----------------------: | :-----: | :-----: | :-----: | :-----: |
|  依賴   | iverilog |    x     |  x   |             x             |    x    |    x    | xquartz |   git   |
|         |    x     |    x     |  x   |             x             |    x    |    x    | gtkwave |    x    |
|  插件   |    x     | coc.nvim | ale  | verilog_systemverilog.vim | neoterm | neoterm | neoterm | neoterm |

## assembly

| assembly |      排版      |
| :------: | :------------: |
|   依賴   |     asmfmt     |
|   插件   | vim-autoformat |

## bash

| bash |   補全   |    偵錯    |      排版      |
| :--: | :------: | :--------: | :------------: |
| 依賴 |    x     | shellcheck |     shfmt      |
| 插件 | coc.nvim |    ale     | vim-autoformat |

## cmake

| cmake |   補全   |      排版      |
| :---: | :------: | :------------: |
| 依賴  |          |  cmake_format  |
| 插件  | coc.nvim | vim-autoformat |

## docker

| docker |   補全   |
| :----: | :------: |
|  依賴  |          |
|  插件  | coc.nvim |
