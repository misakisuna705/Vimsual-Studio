# assembly

<!-- vim-markdown-toc GFM -->

* [1. 排版](#1-排版)
    - [1.1 vim-autoformat](#11-vim-autoformat)
        + [安裝](#安裝)
        + [配置](#配置)

<!-- vim-markdown-toc -->

---

## 1. 排版

### 1.1 vim-autoformat

#### 安裝

```vim
Plug 'Chiel92/vim-autoformat',{'on':'Autoformat'} " 安裝autoformat
```

#### 配置

```vim
" 顯示格式化詳細資料
" let g:autoformat_verbosemode=1

" 按下空白鍵+e時，自動排版
nnoremap <silent> <SPACE>e :Autoformat

" 載入asm_format排版asm檔案
let g:formatdef_asm_format = '"asmfmt"'
let g:formatters_asm = ['asm_format']
```
