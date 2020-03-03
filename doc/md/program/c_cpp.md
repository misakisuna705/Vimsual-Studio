# c / c++

<!-- vim-markdown-toc GFM -->

* [YouCompleteMe](#youcompleteme)
* [YCM-Generator](#ycm-generator)
* [ale](#ale)
* [gdb 8.0.1](#gdb-801)

<!-- vim-markdown-toc -->

---

## YouCompleteMe

```vim
:YcmDebugInfo " debug YCM
```

## YCM-Generator

```vim
:YcmGenerateConfig " 自動生成.ycm_extra_conf.py
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
