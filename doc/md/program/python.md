# python

<!-- vim-markdown-toc GFM -->

* [1. 環境](#1-環境)
    - [1.0. pipenv](#10-pipenv)
        + [安裝](#安裝)
        + [命令](#命令)
* [2. 補全](#2-補全)
    - [2.1. jedi](#21-jedi)
    - [2.2. YouCompleteMe](#22-youcompleteme)
        + [安裝](#安裝-1)
        + [配置](#配置)
* [3. 偵錯](#3-偵錯)
    - [3.1. flake8](#31-flake8)
    - [3.2. ale](#32-ale)
        + [安裝](#安裝-2)
        + [配置](#配置-1)
        + [命令](#命令-1)
* [4. 排版](#4-排版)
    - [4.1. yapf](#41-yapf)
    - [4.2. isort](#42-isort)
    - [4.3. vim-autoformat](#43-vim-autoformat)
        + [安裝](#安裝-3)
        + [配置](#配置-2)
    - [4.4. vim-isort](#44-vim-isort)
        + [安裝](#安裝-4)
        + [配置](#配置-3)
* [5. 直譯](#5-直譯)
    - [5.1. ipython](#51-ipython)
        + [安裝](#安裝-5)
        + [命令](#命令-2)
    - [5.2. neoterm](#52-neoterm)
        + [安裝](#安裝-6)
        + [配置](#配置-4)
* [6. 發佈](#6-發佈)
    - [6.1. git](#61-git)
        + [.gitconfig](#gitconfig)
        + [.gitignore](#gitignore)
    - [6.2. vim-signify](#62-vim-signify)
        + [安裝](#安裝-7)
        + [配置](#配置-5)
    - [6.3. asyncrun.vim](#63-asyncrunvim)
        + [安裝](#安裝-8)
        + [配置](#配置-6)

<!-- vim-markdown-toc -->

---

## 1. 環境

### 1.0. pipenv

#### 安裝

```zsh
pip3 install pipenv # 安裝pipenv
```

#### 命令

```zsh
pipenv install # 在該專案初始化虛擬環境
pipenv graph # 查詢虛擬環境已安裝插件清單
pipenv --rm # 在該專案卸載虛擬環境

pipenv install 插件 # 在虛擬環境安裝該插件
pipenv uninstall 插件 # 在虛擬環境解除安裝該插件

pipenv shell # 載入虛擬環境
```

## 2. 補全

### 2.1. jedi

```zsh
pip3 install jedi # 安裝jedi
```

### 2.2. YouCompleteMe

#### 安裝

```vim
Plug 'Valloric/YouCompleteMe',{'for':['python'],'do':'./install.py --all'} " 安裝YouCompleteMe
```

#### 配置

```vim
" 輸入兩個字元時，開始匹配標籤補全視窗
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2
" 輸入兩個字元時，開始匹配語法/語意補全視窗
let g:ycm_semantic_triggers =  {
            \ 'python': ['re!\w{2}'],
            \ }

" 不顯示補全定義
set completeopt-=preview
" 不用YCM進行實時語法偵錯(使用ale)
let g:ycm_show_diagnostics_ui=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0

" 按下enter鍵時，自動選中當前選項，並關閉補全視窗
let g:ycm_key_list_stop_completion=['<CR>']

" 輸入兩個字元時，開始匹配標籤補全視窗
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2
" 輸入兩個字元時，開始匹配語法/語意補全視窗
```

## 3. 偵錯

### 3.1. flake8

```zsh
pip3 install flake8 # 安裝flake8
```

### 3.2. ale

#### 安裝

```vim
Plug 'w0rp/ale',{'on':'ALELint'} " 安裝ale
```

#### 配置

```vim
" 不進行實時偵錯，保存時才偵錯
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=0
au FileType python
            \ au! BufWrite <buffer> ALELint

" 在quickfix顯示偵錯訊息
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" 設定linter參數
let g:ale_python_flake8_options = '--ignore=E501,E302,E225,E226,E251,E201,E305,E711,E117,E101,F403,F405,W191,W291,W293'

" 設定linter
let g:ale_linters = {
            \   'python': ['flake8'],
            \}

" 設定ale偵錯顯示格式
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" 設定符號
qet g:ale_sign_error='✗'
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

### 4.1. yapf

```zsh
pip3 install yapf # 安裝yapf
```

### 4.2. isort

```zsh
pip3 install isort # 安裝isort
```

### 4.3. vim-autoformat

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

" 載入yapf的google風格排版py檔案
let g:formatdef_misakisuna_yapf='"yapf --style=''{based_on_style: google, column_limit: 150}''"'
let g:formatters_python=['xxx_yapf']
```

### 4.4. vim-isort

#### 安裝

```vim
Plug 'fisadev/vim-isort',{'on':'Isort'} " 安裝vim-isort
```

#### 配置

```vim
" 檔案保存時，自動排版
au BufWrite *.py :Isort
```

## 5. 直譯

### 5.1. ipython

#### 安裝

```zsh
pip3 install ipython # 安裝ipython
```

#### 命令

```zsh
ipython # 載入ipython直譯器
```

### 5.2. neoterm

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

" 按下F1鍵時，直譯該行
au FileType python nnoremap <silent> <F1> :cclose<CR>:let save_view = winsaveview()<CR>:Tclear<CR>:TREPLSendLine<CR>:call winrestview(save_view)<CR>

" 按下F2鍵時，直譯多行
au FileType python vnoremap <silent> <F2> :cclose<CR>:let save_view = winsaveview()<CR>:Tclear<CR>:TREPLSendSelection<CR>:call winrestview(save_view)<CR>

" 按下F3鍵時，直譯python文件
au FileType python nnoremap <silent> <F3> :cclose<CR>:let save_view = winsaveview()<CR>:Tclear<CR>:TREPLSendFile<CR>:call winrestview(save_view)<CR>

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

## 6. 發佈

### 6.1. git

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

### 6.2. vim-signify

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

### 6.3. asyncrun.vim

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
