# markdown

<!-- vim-markdown-toc GFM -->

* [1. 補全](#1-補全)
    - [1.0. vim-markdown-toc](#10-vim-markdown-toc)
        + [安裝](#安裝)
        + [配置](#配置)
* [2. 排版](#2-排版)
    - [2.1. prettier](#21-prettier)
    - [2.2. vim-autoformat](#22-vim-autoformat)
        + [安裝](#安裝-1)
        + [配置](#配置-1)
* [3. 推播](#3-推播)
    - [3.1. markdown-preview.vim](#31-markdown-previewvim)
        + [安裝](#安裝-2)
        + [配置](#配置-2)
    - [3.2. mathjax-support-for-mkdp](#32-mathjax-support-for-mkdp)
* [4. 發佈](#4-發佈)
    - [4.1. git](#41-git)
        + [.gitconfig](#gitconfig)
        + [.gitignore](#gitignore)
    - [4.2. vim-signify](#42-vim-signify)
        + [安裝](#安裝-3)
        + [配置](#配置-3)
    - [4.3. asyncrun.vim](#43-asyncrunvim)
        + [安裝](#安裝-4)
        + [配置](#配置-4)

<!-- vim-markdown-toc -->

---

## 1. 補全

### 1.0. vim-markdown-toc

#### 安裝

```vim
Plug 'mzlogin/vim-markdown-toc', {'on': ['GenTocGFM', 'RemoveToc']} " 安裝vim-markdown-toc
```

#### 配置

```vim
" 生成github格式目錄
let g:vmt_fence_hidden_markdown_style='GFM'
" 優化目錄語法
let g:vmt_cycle_list_item_markers = 1

" 按下F3鍵時，生成目錄
au FileType markdown nnoremap <F3> :GenTocGFM<CR>
" 按下F4鍵時，刪去目錄
au FileType markdown nnoremap <F4> :RemoveToc<CR>
```

## 2. 排版

### 2.1. prettier

```zsh
yarn global add prettier # 在全局安裝prettier
```

### 2.2. vim-autoformat

#### 安裝

```vim
Plug 'Chiel92/vim-autoformat',{'on':'Autoformat'} " 安裝autoformat
```

#### 配置

```vim
" 顯示格式化詳細資料
" let g:autoformat_verbosemode=1

" 檔案保存時，自動排版
au BufWrite * :Autoformat

" 載入prettier排版md檔案
let g:formatters_markdown=['prettier']
```

## 3. 推播

### 3.1. markdown-preview.vim

#### 安裝

```vim
Plug 'iamcco/markdown-preview.vim',{'on':'<Plug>MarkdownPreview'} " 安裝markdown-preview
```

#### 配置

```vim
" 按下F1鍵時，轉譯並推播md檔案
au FileType markdown nmap <F1> <Plug>MarkdownPreview
" 按下F2鍵時，關閉md推播
au FileType markdown nmap <F2> <Plug>StopMarkdownPreview
```

### 3.2. mathjax-support-for-mkdp

```vim
Plug 'iamcco/mathjax-support-for-mkdp',{'on':'<Plug>MarkdownPreview'} " 安裝mathjax-support-for-mkdp
```

## 4. 發佈

### 4.1. git

#### .gitconfig

```zsh
[user]
    name = <xxx>
    email = <xxx@gmail.com>
```

#### .gitignore

```zsh
.DS_Store
```

### 4.2. vim-signify

#### 安裝

```zsh
Plug 'mhinz/vim-signify' " 安裝vim-signify
```

#### 配置

```zsh
" 按下shift+f鍵時，跳轉signify
function! s:signify_hunk_next(count) abort
    let oldpos = getcurpos()
    call sy#jump#next_hunk(a:count)
    if getcurpos() == oldpos
        call sy#jump#prev_hunk(9999)
    endif
endfunction

nnoremap <silent> <expr> <plug>(sy-hunk-next) &diff
            \ ? ']c'
            \ : ":\<c-u>call <sid>signify_hunk_next(v:count1)\<cr>"

nmap <S-f> <plug>(sy-hunk-next)
```

### 4.3. asyncrun.vim

#### 安裝

```vim
Plug 'skywind3000/asyncrun.vim',{'on':'AsyncRun'} " 安裝asyncrun
```

#### 配置

```vim
" 設定asyncrun編譯所在專案之根目錄
let g:asyncrun_rootmarks=['.git']

" 設定quickfix高度
let g:asyncrun_open=8

" 按下F11鍵時，把專案上傳github
function GitUpdate()
    if exists("g:qfix_win")
        AsyncRun -cwd=$(VIM_ROOT) git add . && git commit -m "commit" && git push
    elseif exists("g:Topenflag")
        Tclose
        unlet g:Topenflag
        AsyncRun -cwd=$(VIM_ROOT) git add . && git commit -m "commit" && git push
        let g:qfix_win = bufnr("$")
    else
        AsyncRun -cwd=$(VIM_ROOT) git add . && git commit -m "commit" && git push
        let g:qfix_win = bufnr("$")
    endif
endfunction
nnoremap <silent> <F11> :call GitUpdate()<CR>
```
