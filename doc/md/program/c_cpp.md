# c / c++

<!-- vim-markdown-toc GFM -->

* [1. 補全](#1-補全)
    - [1.1. cmake](#11-cmake)
    - [1.2. YouCompleteMe](#12-youcompleteme)
        + [安裝](#安裝)
        + [配置](#配置)
        + [命令](#命令)
    - [1.3. YCM-Generator](#13-ycm-generator)
        + [安裝](#安裝-1)
        + [命令](#命令-1)
* [2. 偵錯](#2-偵錯)
    - [2.1. cppcheck](#21-cppcheck)
    - [2.2. ale](#22-ale)
        + [安裝](#安裝-2)
        + [配置](#配置-1)
        + [命令](#命令-2)
* [3. 標籤](#3-標籤)
    - [3.1. universal-ctags](#31-universal-ctags)
    - [3.2. cppman](#32-cppman)
    - [3.3. vim-gutentags](#33-vim-gutentags)
        + [安裝](#安裝-3)
        + [配置](#配置-2)
    - [3.4. vim-preview](#34-vim-preview)
        + [安裝](#安裝-4)
        + [配置](#配置-3)
    - [3.5. split-manpage.vim](#35-split-manpagevim)
        + [安裝](#安裝-5)
        + [配置](#配置-4)
    - [3.6. vim-cppman](#36-vim-cppman)
        + [安裝](#安裝-6)
        + [配置](#配置-5)
* [4. 排版](#4-排版)
    - [4.1. astyle](#41-astyle)
    - [4.2. vim-autoformat](#42-vim-autoformat)
        + [安裝](#安裝-7)
        + [配置](#配置-6)
* [5. 編譯](#5-編譯)
    - [5.1. ninja](#51-ninja)
    - [5.2. cmake](#52-cmake)
        + [安裝](#安裝-8)
        + [配置（ CMakeLists.txt ）](#配置-cmakeliststxt-)
    - [5.3. asyncrun.vim](#53-asyncrunvim)
        + [安裝](#安裝-9)
        + [配置](#配置-7)
* [6. 執行](#6-執行)
    - [6.0. neoterm](#60-neoterm)
        + [安裝](#安裝-10)
        + [配置](#配置-8)
* [7. 調試](#7-調試)
    - [7.1. gdb](#71-gdb)
        + [安裝](#安裝-11)
        + [配置（ .gdbinit ）](#配置-gdbinit-)
        + [命令](#命令-3)
    - [7.2. termdebug](#72-termdebug)
* [8. 發佈](#8-發佈)
    - [8.1. git](#81-git)
        + [.gitconfig](#gitconfig)
        + [.gitignore](#gitignore)
    - [8.2. vim-signify](#82-vim-signify)
        + [安裝](#安裝-12)
        + [配置](#配置-9)
    - [8.3. asyncrun.vim](#83-asyncrunvim)
        + [安裝](#安裝-13)
        + [配置](#配置-10)

<!-- vim-markdown-toc -->

---

## 1. 補全

### 1.1. cmake

```zsh
brew install cmake # 安裝cmake
```

### 1.2. YouCompleteMe

#### 安裝

```vim
Plug 'Valloric/YouCompleteMe',{'for':['c','cpp'],'do':'./install.py --all'} " 安裝YouCompleteMe
```

#### 配置

```vim
" 設定.ycm_extra_conf.py預設位置
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 自動偵測.ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0

" 輸入兩個字元時，開始匹配標籤補全視窗
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2
" 輸入兩個字元時，開始匹配語法/語意補全視窗
let g:ycm_semantic_triggers =  {
            \ 'c,cpp': ['re!\w{2}'],
            \ }

" 不顯示補全定義
set completeopt-=preview
" 不用YCM進行實時語法偵錯(使用ale)
let g:ycm_show_diagnostics_ui=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0

" 按下enter鍵時，自動選中當前選項，並關閉補全視窗
let g:ycm_key_list_stop_completion=['<CR>']
```

#### 命令

```vim
:YcmDebugInfo
```

### 1.3. YCM-Generator

#### 安裝

```vim
Plug 'rdnetto/YCM-Generator',{'on':'YcmGenerateConfig','branch': 'stable'} " 安裝YCM-Generator
```

#### 命令

```vim
:YcmGenerateConfig " 自動生成.ycm_extra_conf.py
```

## 2. 偵錯

### 2.1. cppcheck

```zsh
brew install cppcheck # 安裝cppcheck
```

### 2.2. ale

#### 安裝

```vim
Plug 'w0rp/ale',{'on':'ALELint'} " 安裝ale
```

#### 配置

```vim
" 不進行實時偵錯，保存時才偵錯
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=0
au FileType c,cpp
            \ au! BufWrite <buffer> ALELint

" 在quickfix顯示偵錯訊息
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" 設定linter
let g:ale_linters = {
            \   'c': ['clang', 'cppcheck'],
            \   'cpp': ['clang', 'cppcheck'],
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

## 3. 標籤

### 3.1. universal-ctags

```zsh
brew install --HEAD universal-ctags/universal-ctags/universal-ctags # 安裝ctags
```

### 3.2. cppman

```zsh
pip3 install cppman # 安裝cppman
```

### 3.3. vim-gutentags

#### 安裝

```vim
Plug 'ludovicchabant/vim-gutentags' " 安裝gutentags
```

#### 配置

```vim
" 設定標籤搜尋所在專案之根目錄
let g:gutentags_project_root = ['.git']

" 設定標籤存放目錄與副檔名
if !isdirectory(expand('~/.cache/tags'))
    silent! call mkdir(expand('~/.cache/tags'))
endif
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_tagfile = '.tags'

" 設定標籤參數
let g:gutentags_ctags_extra_args = ['--fields=+lniazS', '--extra=+q', '--exclude=build', '--langmap=c:.c.h']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
```

### 3.4. vim-preview

#### 安裝

```vim
Plug 'skywind3000/vim-preview',{'on':['PreviewTag','PreviewQuickfix']} " 安裝vim-preview
```

#### 配置

```vim
" 使預覽視窗不要出現在buffer列表
let g:preview_nolist=1

" 按下shift+m鍵時，垂直分屏後預覽函數標籤
nnoremap <silent> <S-m> :PreviewTag<CR>
" 按下shift+n鍵時，開新buffer後預覽函數標籤
nnoremap <silent> <S-n> :PreviewGoto edit<CR>:PreviewClose<CR>
" 按下shift+h鍵時，關閉分屏後跳轉回檔案
nnoremap <silent> <S-h> :PreviewClose<CR>
```

### 3.5. split-manpage.vim

#### 安裝

```vim
Plug 'ludwig/split-manpage.vim',{'for':'c'}
```

#### 配置

```vim
" 啟動K鍵
let g:split_manpage_disable_K = 0

" 按下q鍵時，垂直分屏後預覽man
au FileType c map q <Leader>kl
```

### 3.6. vim-cppman

#### 安裝

```vim
Plug 'gauteh/vim-cppman',{'on':'Cppman'}
```

#### 配置

```vim
" 按下q鍵時，垂直分屏後預覽cppman
au FileType cpp nnoremap <silent> q :Cppman <cword><CR><CR>:hi Normal ctermbg=NONE<CR>:hi LineNr ctermbg=NONE<CR>:hi CursorLineNr cterm=bold<CR>:hi PMenu ctermfg=0 ctermbg=242<CR>
```

## 4. 排版

### 4.1. astyle

```zsh
brew install astyle # 安裝astyle
```

### 4.2. vim-autoformat

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

" 載入astyle的google風格排版c/cpp檔案
let g:formatdef_xxx_astyle='"astyle --style=google --indent-switches --indent-namespaces "'
let g:formatters_c=['xxx_astyle']
let g:formatters_cpp=['xxx_astyle']
```

## 5. 編譯

### 5.1. ninja

```zsh
brew install ninja # 安裝ninja
```

### 5.2. cmake

#### 安裝

```zsh
brew install cmake # 安裝cmake
```

#### 配置（ CMakeLists.txt ）

```zsh
#cmake環境設定
cmake_minimum_required(VERSION 3.13)

#project設定
project(main)

#exe設定
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/test)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/bin)

#src設定
file(GLOB_RECURSE SRC
    "${PROJECT_SOURCE_DIR}/src/*.cpp"
    "${PROJECT_SOURCE_DIR}/src/*.c"
    )
add_executable(${PROJECT_NAME} ${SRC})

#include設定
include_directories(
    ${PROJECT_SOURCE_DIR}/include
    #    /usr/local/Cellar/allegro/*/include
    )

#lib設定
#link_directories(
#    /usr/local/Cellar/allegro/*/lib
#    )
#file(GLOB LIB
#    "/usr/local/Cellar/allegro/*/lib/*.dylib"
#    )
#target_link_libraries(${PROJECT_NAME} ${LIB})

#flag設定
set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 17
    )

#message設定
message("PROJECT_SOURCE_DIR                     = ${PROJECT_SOURCE_DIR}")
message("CURRENT_BINARY_DIR                     = ${PROJECT_BINARY_DIR}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG   = ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE = ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}")
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

" 按下F1鍵時，更新build.ninja並建構c / cpp專案
function! CompileCpp()
    if exists("g:qfix_win")
        AsyncRun -cwd=$(VIM_ROOT) cmake . -GNinja -DCMAKE_BUILD_TYPE=Release -Bbuild/release && cd build/release && ninja
    else
        Tclose
        unlet g:Topenflag
        AsyncRun -cwd=$(VIM_ROOT) cmake . -GNinja -DCMAKE_BUILD_TYPE=Release -Bbuild/release && cd build/release && ninja
        let g:qfix_win = bufnr("$")
    endif
endfunction
au FileType c,cpp nnoremap <silent> <F1> :call CompileCpp()<CR>

" 按下F3鍵時，更新build.ninja並建構c / cpp測試
au FileType c,cpp nnoremap <silent> <F3> :Tclose<CR>:AsyncRun -cwd=$(VIM_ROOT) cmake . -GNinja -DCMAKE_BUILD_TYPE=Debug -Bbuild/test && cd build/test && ninja<CR>
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

" 自動顯示行號
au BufLeave *.cpp set number

" 標記終端機的空白鍵和換行符
hi NonText ctermfg=242 ctermbg=NONE
au TerminalOpen * set list listchars=space:_

" 按下F2鍵時，執行c / cpp專案
function ExeCpp()
    if exists("g:qfix_win")
        cclose
        let save_view = winsaveview()
        Topen
        let g:Topenflag=1
        Tclear
        T [ "$(ls data/)" ] && bin/main < data/*.* || bin/main
        call winrestview(save_view)
        unlet g:qfix_win
    else
        let save_view = winsaveview()
        Tclear
        T [ "$(ls data/)" ] && bin/main < data/*.* || bin/main
        call winrestview(save_view)
    endif
endfunction
au FileType c,cpp nnoremap <silent> <F2> :call ExeCpp()<CR>

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

## 7. 調試

### 7.1. gdb

#### 安裝

```zsh
brew install gdb # 安裝gdb最新版
brew unlink gdb # 斷開gdb最新版
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/9ec9fb27a33698fc7636afce5c1c16787e9ce3f3/Formula/gdb.rb # 安裝gdb 8.0.1
```

```zsh
codesign -fs gdb_certificate /usr/local/bin/gdb # 簽署憑證
```

#### 配置（ .gdbinit ）

```zsh
set startup-with-shell off
```

#### 命令

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

### 7.2. termdebug

```vim
" 版面配置
let g:termdebug_wide = 1

" termdebug去背
au TerminalOpen * hi debugBreakpoint cterm=bold ctermbg=None
au TerminalOpen * hi debugPC ctermbg=242

" 按下shift+k鍵時，游標移到下一段
au BufLeave * nnoremap <S-k> }

" 按下F4鍵時，測試c / cpp專案
au FileType c,cpp nnoremap <silent> <F4> :cclose<CR>:Tclose<CR>:cd %:p:h<CR>:packadd termdebug<CR>:Termdebug test/%:t:r<CR><C-w><C-h>:aunmenu WinBar<CR>

" 按下F5鍵時，設置斷點
au FileType c,cpp nnoremap <silent> <F5> :Break<CR>

" 按下F6鍵時，清除斷點
au FileType c,cpp nnoremap <silent> <F6> :Clear<CR>

" 按下F7鍵時，執行調試
au FileType c,cpp nnoremap <silent> <F7> :Run<CR>

" 按下F8鍵時，繼續調試
au FileType c,cpp nnoremap <silent> <F8> :Continue<CR>

" 按下F9鍵時，單步繼續
au FileType c,cpp nnoremap <silent> <F9> :Over<CR>

" 按下F10鍵時，單步進入
au FileType c,cpp nnoremap <silent> <F10> :Step<CR>
```

## 8. 發佈

### 8.1. git

#### .gitconfig

```zsh
[user]
    name = <misakisuna705>
    email = <misakisuna705@gmail.com>
```

#### .gitignore

```zsh
.DS_Store
build/
test/
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
