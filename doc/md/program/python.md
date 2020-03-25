# python

<!-- vim-markdown-toc GFM -->

* [pipenv](#pipenv)
* [coc.nvim](#cocnvim)
    - [命令](#命令)
    - [插件](#插件)
* [ale](#ale)

<!-- vim-markdown-toc -->

---

## pipenv

```zsh
pipenv install # 在該專案初始化虛擬環境
pipenv graph # 查詢虛擬環境已安裝插件清單
pipenv --rm # 在該專案卸載虛擬環境

pipenv install 插件 # 在虛擬環境安裝該插件
pipenv uninstall 插件 # 在虛擬環境解除安裝該插件

pipenv shell # 載入虛擬環境
```

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
