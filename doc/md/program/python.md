# python

<!-- vim-markdown-toc GFM -->

* [pipenv](#pipenv)
* [YouCompleteMe](#youcompleteme)
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

## YouCompleteMe

```vim
:YcmDebugInfo " debug YCM
```

## ale

```vim
:ALEInfo " 查詢ale支援的linter
:ALEDetail " debug ale
```
