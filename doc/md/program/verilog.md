# verilog

<!-- vim-markdown-toc GFM -->

* [1. 環境](#1-環境)
    - [1.0. icarus-verilog](#10-icarus-verilog)
* [2. 補全](#2-補全)
    - [2.0. YouCompleteMe](#20-youcompleteme)
        + [安裝](#安裝)
        + [配置](#配置)
* [3. 偵錯](#3-偵錯)
    - [3.0. ale](#30-ale)
        + [安裝](#安裝-1)
        + [配置](#配置-1)
        + [命令](#命令)
* [4. 排版](#4-排版)
    - [4.0. verilog-systemverilog.vim](#40-verilog-systemverilogvim)
* [5. 編譯](#5-編譯)
    - [5.0. asyncrun.vim](#50-asyncrunvim)
        + [安裝](#安裝-2)
        + [配置](#配置-2)
* [6. 執行](#6-執行)
    - [6.0. neoterm](#60-neoterm)
        + [安裝](#安裝-3)
        + [配置](#配置-3)
* [7. 推播](#7-推播)
    - [7.1. xquartz](#71-xquartz)
    - [7.2. gtkwave](#72-gtkwave)
    - [7.3. neoterm](#73-neoterm)
        + [安裝](#安裝-4)
        + [配置](#配置-4)
* [8. 發佈](#8-發佈)
    - [8.1. git](#81-git)
        + [.gitconfig](#gitconfig)
        + [.gitignore](#gitignore)
    - [8.2. vim-signify](#82-vim-signify)
        + [安裝](#安裝-5)
        + [配置](#配置-5)
    - [8.3. asyncrun.vim](#83-asyncrunvim)
        + [安裝](#安裝-6)
        + [配置](#配置-6)

<!-- vim-markdown-toc -->

---

## 1. 環境

### 1.0. icarus-verilog

```zsh
brew install icarus-verilog # 安裝iverilog
```

## 2. 補全

### 2.0. YouCompleteMe

#### 安裝

```vim
Plug 'Valloric/YouCompleteMe',{'for':'verilog_systemverilog','do':'./install.py --all'}
```

#### 配置

```vim
" 輸入兩個字元時，開始匹配標籤補全視窗
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2

" 不顯示補全定義
set completeopt=menu,menuone
" 不用YCM進行實時語法偵錯(使用ale)
let g:ycm_show_diagnostics_ui=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0

" 按下enter鍵時，自動選中當前選項，並關閉補全視窗
let g:ycm_key_list_stop_completion=['<CR>']

" 按下begin+enter鍵時，自動換行縮進補全end
au FileType verilog_systemverilog inoremap begin<CR> begin<CR>end<ESC><UP>$<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
" 按下(+enter鍵時，自動換行縮進補全)
au FileType verilog_systemverilog inoremap (<CR> (<CR>);<ESC><UP>o
```

## 3. 偵錯

### 3.0. ale

#### 安裝

```vim
Plug 'w0rp/ale',{'on':'ALELint'} " 安裝ale
```

#### 配置

```vim
" 不進行實時偵錯，保存時才偵錯
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=0
au FileType verilog_systemverilog
            \ au! BufWrite <buffer> ALELint

" 在quickfix顯示偵錯訊息
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" 設定linter
let g:ale_linters = {
            \   'verilog_systemverilog': ['iverilog'],
            \}

" 設定ale偵錯顯示格式
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" 設定符號
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚡'
" 符號背景使用iterm
hi clear ALEErrorSign
hi clear ALEWarningSign
" 標示背景使用底線
au VimEnter * hi ALEWarning cterm=underline
au VimEnter * hi ALEError cterm=underline

" 按下f鍵時，跳轉偵錯訊息
nmap f <Plug>(ale_next_wrap)
```

#### 命令

```vim
:ALEInfo
:ALEDetail
```

## 4. 排版

### 4.0. verilog-systemverilog.vim

```vim
Plug 'vhda/verilog_systemverilog.vim',{'for':'verilog_systemverilog'}
```

## 5. 編譯

### 5.0. asyncrun.vim

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

" 按下F1鍵時，編譯verilog檔案
function! CompileVerilog()
    if exists("g:qfix_win")
        AsyncRun -cwd=$(VIM_ROOT) iverilog -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" "$(VIM_FILEDIR)/header.v" "$(VIM_FILEPATH)" "$(VIM_FILEDIR)/$(VIM_FILENOEXT)_tb.v"
    elseif exists("g:Topenflag")
        Tclose
        unlet g:Topenflag
        AsyncRun -cwd=$(VIM_ROOT) iverilog -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" "$(VIM_FILEDIR)/header.v" "$(VIM_FILEPATH)" "$(VIM_FILEDIR)/$(VIM_FILENOEXT)_tb.v"
        let g:qfix_win = bufnr("$")
    else
        AsyncRun -cwd=$(VIM_ROOT) iverilog -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" "$(VIM_FILEDIR)/header.v" "$(VIM_FILEPATH)" "$(VIM_FILEDIR)/$(VIM_FILENOEXT)_tb.v"
        let g:qfix_win = bufnr("$")
    endif
endfunction
au FileType verilog_systemverilog nnoremap <silent> <F1> :call CompileVerilog()<CR>
```

## 6. 執行

### 6.0. neoterm

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

" 按下F2鍵時，執行verilog檔案
function ExeVerilog()
    if exists("g:qfix_win")
        cclose
        let save_view = winsaveview()
        Tclear
        Topen
        let g:Topenflag=1
        T clear && vvp ./%:t:r
        call winrestview(save_view)
        unlet g:qfix_win
    else
        let save_view = winsaveview()
        Topen
        let g:Topenflag=1
        T clear && vvp ./%:t:r
        call winrestview(save_view)
    endif
endfunction
au FileType verilog_systemverilog nnoremap <silent> <F2> :call ExeVerilog()<CR>

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

## 7. 推播

### 7.1. xquartz

```zsh
brew cask install xquartz # 安裝xquartz
```

### 7.2. gtkwave

```zsh
brew cask install gtkwave # 安裝gtkwave
```

### 7.3. neoterm

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

" 按下F3鍵時，推播verilog檔案
au FileType verilog_systemverilog nnoremap <silent> <F3> :cclose<CR>:let save_view = winsaveview()<CR>:T open -a gtkwave %:t:r.vcd<CR>:call winrestview(save_view)<CR>

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

## 8. 發佈

### 8.1. git

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

### 8.2. vim-signify

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

### 8.3. asyncrun.vim

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
