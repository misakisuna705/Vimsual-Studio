# c / c++

<!-- vim-markdown-toc GFM -->

* [coc.nvim](#cocnvim)
    - [命令](#命令)
    - [插件](#插件)
* [ale](#ale)
* [gdb 8.0.1](#gdb-801)

<!-- vim-markdown-toc -->

---

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

```vim
coc-clangd
```

## ale

```vim
:ALEInfo " 查詢ale支援的linter
:ALEDetail " debug ale
```

## gdb 8.0.1

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
