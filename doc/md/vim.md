# vim

<!-- vim-markdown-toc GFM -->

* [vim-plug](#vim-plug)
  - [命令](#命令)
  - [插件](#插件)
* [coc.nvim](#cocnvim)
  - [命令](#命令-1)
  - [插件](#插件-1)
* [ale](#ale)
* [gdb 8.0.1](#gdb-801)
  - [安裝](#安裝)
  - [命令](#命令-2)
* [pipenv](#pipenv)
  - [命令](#命令-3)
* [yarn](#yarn)
* [typescript](#typescript)
* [gulp](#gulp)
* [dotnet-sdk](#dotnet-sdk)

<!-- vim-markdown-toc -->

---

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

## coc.nvim

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
|    coc-css    |
|  coc-clangd   |

## ale

```vim
:ALEInfo " 查詢ale支援的linter
:ALEDetail " debug ale
```

## gdb 8.0.1

### 安裝

```zsh
brew unlink gdb
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/9ec9fb27a33698fc7636afce5c1c16787e9ce3f3/Formula/gdb.rb
```

### 命令

```zsh
b 行數 # 在main.c某行設置斷點
b xxx.c:行數 # 在xxx.c某行設置斷點

r # 開始調試
c # 繼續調試

n # 單步繼續
s # 單步進入

p 變數 # 印變數存值
p &變數 # 印變數位址
```

## pipenv

### 命令

```zsh
pipenv install # 在該專案初始化虛擬環境
pipenv graph # 查詢虛擬環境已安裝插件清單
pipenv --rm # 在該專案卸載虛擬環境
pipenv install 插件 # 在虛擬環境安裝該插件
pipenv uninstall 插件 # 在虛擬環境解除安裝該插件
pipenv shell # 載入虛擬環境
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
gulp # 將webpage推播到瀏覽器
```

## dotnet-sdk

```zsh
dotnet new console # 初始化專案環境
dotnet run # 編譯並執行該專案
```
