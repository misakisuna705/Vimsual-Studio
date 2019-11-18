<!-- vim-markdown-toc GFM -->

* [1. 環境](#1-環境)
    - [1.0. dotnet-sdk](#10-dotnet-sdk)
        + [安裝](#安裝)
        + [命令](#命令)
* [2. 補全](#2-補全)
    - [2.0. coc.nvim](#20-cocnvim)
        + [安裝](#安裝-1)
        + [配置](#配置)
        + [命令](#命令-1)
        + [插件](#插件)
        + [配置（ coc-settings.json ）](#配置-coc-settingsjson-)
* [3. 排版](#3-排版)
    - [3.1. astyle](#31-astyle)
    - [3.2. vim-autoformat](#32-vim-autoformat)
        + [安裝](#安裝-2)
        + [配置](#配置-1)
* [4. 編譯執行](#4-編譯執行)
    - [4.1. dotnet-sdk](#41-dotnet-sdk)
        + [安裝](#安裝-3)
        + [命令](#命令-2)
    - [4.2. neoterm](#42-neoterm)
        + [安裝](#安裝-4)
        + [配置](#配置-2)
* [5. 發佈](#5-發佈)
    - [5.1. git](#51-git)
        + [.gitconfig](#gitconfig)
        + [.gitignore](#gitignore)
    - [5.2. vim-signify](#52-vim-signify)
        + [安裝](#安裝-5)
        + [配置](#配置-3)
    - [5.3. asyncrun.vim](#53-asyncrunvim)
        + [安裝](#安裝-6)
        + [配置](#配置-4)

<!-- vim-markdown-toc -->

---

## 1. 環境

### 1.0. dotnet-sdk

#### 安裝

```zsh
brew cask install dotnet-sdk # 安裝dotnet-sdk
```

#### 命令

```zsh
dotnet new console # 初始化專案環境
```

## 2. 補全

### 2.0. coc.nvim

#### 安裝

```vim
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for':['cs']}
```

#### 配置

```vim
" 安裝coc插件
let g:coc_global_extensions = ['coc-omnisharp']

" 按下tab鍵或shift+tab鍵時，上下瀏覽補全視窗
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 按下enter鍵時，自動選中當前選項，並關閉補全視窗
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
```

#### 命令

```vim
:CocList extensions

:CocInstall
:CocUninstall

:CocUpdate

:CocConfig
```

#### 插件

```vim
coc-omnisharp
```

#### 配置（ coc-settings.json ）

```zsh
{
    "coc.preferences.noselect": false,
    "coc.preferences.minTriggerInputLength": 2,
    "coc.preferences.diagnostic.enable": false
}
```

## 3. 排版

### 3.1. astyle

```zsh
brew install astyle # 安裝astyle
```

### 3.2. vim-autoformat

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

" 載入astyle的google風格排版cs檔案
let g:formatdef_misakisuna_astyle='"astyle --style=google --indent-switches --indent-namespaces -p"'
let g:formatters_cs=['misakisuna_astyle']
```

## 4. 編譯執行

### 4.1. dotnet-sdk

#### 安裝

```zsh
brew cask install dotnet-sdk # 安裝dotnet-sdk
```

#### 命令

```zsh
dotnet run # 編譯並執行該專案
```

### 4.2. neoterm

#### 安裝

```vim
Plug 'kassio/neoterm', {'on': ['T', 'Topen', 'Tclose', 'Tclear']} " 安裝neoterm
```

#### 配置

```vim
" 設定neoterm位置
let g:neoterm_default_mod='botright'

" 設定neoterm高度
let g:neoterm_size=8

" 標記終端機的空白鍵和換行符
hi NonText ctermfg=242 ctermbg=NONE
au TerminalOpen * set list listchars=space:_

" 按下F1鍵時，編譯執行csharp專案
function CompileExeCsharp()
    if exists("g:qfix_win")
        cclose
        let save_view = winsaveview()
        Topen
        let g:Topenflag=1
        Tclear
        T dotnet run
        call winrestview(save_view)
        unlet g:qfix_win
    else
        let save_view = winsaveview()
        let g:Topenflag=1
        Tclear
        T dotnet run
        call winrestview(save_view)
    endif
endfunction
au FileType cs nnoremap <silent> <F1> :call CompileExeCsharp()<CR>

" 按下F12鍵，切換終端機與quickfix
function! QTtoggle()
    if exists("g:qfix_win")
        cclose
        Topen
        let g:Topenflag=1
        wincmd h
        wincmd k
        unlet g:qfix_win
    elseif exists("g:Topenflag")
        Tclose
        unlet g:Topenflag
        botright 8copen
        wincmd h
        wincmd k
        let g:qfix_win = bufnr("$")
    else
        botright 8copen
        wincmd h
        wincmd k
        let g:qfix_win = bufnr("$")
    endif
endfunction
nnoremap <silent> <F12> :call QTtoggle()<CR>

" 按下空白鍵+q+enter鍵時，關閉終端機
tnoremap <silent> <SPACE>q exit
```

## 5. 發佈

### 5.1. git

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

### 5.2. vim-signify

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

### 5.3. asyncrun.vim

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
