# vim（ .vimrc ）

<!-- vim-markdown-toc GFM -->

* [1. 安裝](#1-安裝)
* [2. 環境](#2-環境)
    - [2.1. 系統](#21-系統)
    - [2.2. 主題](#22-主題)
    - [2.3. 映射](#23-映射)
* [3. 插件](#3-插件)
    - [3.1. vim-plug](#31-vim-plug)
    - [3.2. 配置](#32-配置)
    - [3.3. 命令](#33-命令)

<!-- vim-markdown-toc -->

---

## 1. 安裝

```zsh
brew install vim # 安裝vim
```

## 2. 環境

### 2.1. 系統

```vim
" 設定js檔案類型
au BufNewFile,BufRead *.js setlocal filetype=javascript

" 不產生暫存檔
set noswapfile
" 切換buffer不關閉文件
set hidden
" 簡化狀態列訊息
set shortmess+=c
" 游標刷新時間
set updatetime=300

" 共用系統剪貼板
set clipboard=unnamed
" 設置命令鍵反應時間
set ttimeout ttimeoutlen=100
" 垂直分屏靠右
set splitright
" 主畫面關閉時，自動關閉剩餘窗口
au BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" 使delete(backspace)鍵能正常使用
set backspace=2
" 使光標限制於頂部底部3行
set scrolloff=3
" 使游標能跨行使用
set whichwrap=b,s,<,>,[,]
" 使滑鼠能正常使用
set mouse=a

" 設定行數
set textwidth=150
" 自動對齊縮排
set autoindent
" 按下tab鍵或自動對齊縮排時，電腦辨認為space語法
set expandtab
" 按下tab鍵時，電腦顯示為4個空格(不一定辨認為space語法)
set softtabstop=4
" 使用tab語法時，電腦顯示為4個空格
set tabstop=4
" 自動對齊縮排時，電腦顯示為4個空格(不一定辨認為space語法)
set shiftwidth=4

" 在makefile檔案中，按下tab鍵時，電腦辨認為tab語法
au FileType make set noexpandtab
```

### 2.2. 主題

```vim
" vim背景使用iterm
hi Normal ctermbg=NONE

" popmenu背景使用灰色
hi PMenu ctermfg=0 ctermbg=242

" 自動顯示sign欄位
set signcolumn=yes
" sign欄位去背
hi SignifySignAdd    cterm=bold ctermbg=None  ctermfg=119
hi SignifySignDelete cterm=bold ctermbg=None  ctermfg=167
hi SignifySignChange cterm=bold ctermbg=None  ctermfg=227

" 自動顯示行號
set number
" 行號去背
hi LineNr ctermbg=NONE
" 游標所在行號粗體顯示
hi CursorLineNr cterm=bold

" 高亮所在行位
set cursorline
" 高亮所在欄位
set cursorcolumn
```

### 2.3. 映射

```vim
" 按下a鍵時，自動進入插入模式
nnoremap <silent> a <INSERT>
" 按下;鍵時，自動進入插入模式並遞進一格
nnoremap <silent> ; a
" 按下k+j鍵時，自動離開插入模式
inoremap <silent> kj <ESC>
tnoremap <silent> kj <C-\><C-n>
" 按下空白鍵+w時，保存檔案
nnoremap <SPACE>w :w

" 按下j鍵時，游標左移
nnoremap j <LEFT>
vnoremap j <LEFT>
" 按下l鍵時，游標右移
nnoremap l <RIGHT>
vnoremap l <RIGHT>
" 按下i鍵時，游標上移
nnoremap i g<UP>
vnoremap i <UP>
" 按下k鍵時，游標下移
nnoremap k g<DOWN>
vnoremap k <DOWN>
" 按下shift+j鍵時，游標高速前移
nnoremap <S-j> B
vnoremap <S-j> B
" 按下shift+l鍵時，游標高速後移
nnoremap <S-l> W
vnoremap <S-l> W
" 按下shift+i鍵時，游標移到上一段
nnoremap <S-i> {
vnoremap <S-i> {
" 按下shift+k鍵時，游標移到下一段
nnoremap <S-k> }
vnoremap <S-k> }

" 按下control+j鍵時，向左切換視窗
nnoremap <C-j> <C-w><C-h>
tnoremap <C-j> <C-w><C-h>
" 按下control+l鍵時，向右切換視窗
nnoremap <C-l> <C-w><C-l>
tnoremap <C-l> <C-w><C-l>
" 按下control+i鍵時，向上切換視窗
nnoremap <C-i> <C-w><C-k>
tnoremap <C-i> <C-w><C-k>
" 按下control+k鍵時，向下切換視窗
nnoremap <C-k> <C-w><C-j>
tnoremap <C-k> <C-w><C-j>

" 按下{+enter鍵時，自動換行縮進補全}
inoremap {<CR> {<CR>}<ESC><UP>$<LEFT><LEFT>
" 按下enter鍵時，在普通模式新增空白行
nnoremap <CR> o<ESC>
" 按下shift+u鍵時，重做上一個動作
nnoremap <S-u> <C-r>
```

## 3. 插件

### 3.1. vim-plug

```vim
" 自動安裝vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 自動安裝所有插件
au VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

" 插件開始位置
call plug#begin('~/.vim/plugged')

" 安裝檔案搜尋插件
Plug 'airblade/vim-rooter',{'on':'Rooter'}
Plug 'scrooloose/nerdtree',{'on': ['NERDTreeVCS', 'NERDTreeClose']}
Plug 'Yggdroot/LeaderF',{'on':'LeaderfFile','do':'./install.sh'}

" 安裝標籤搜尋插件
Plug 'liuchengxu/vista.vim',{'on': ['Vista', 'Vista!']}

" 安裝關鍵字搜尋插件
Plug 'easymotion/vim-easymotion',{'on':'<Plug>(easymotion-sn)'}

" 安裝編輯輔助插件
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter',{'on':'<plug>NERDCommenterToggle'}

" 安裝環境插件
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" 插件啟用終點
call plug#end()
```

### 3.2. 配置

```vim
" vim-rooter

" 切換根目錄時不顯示訊息
let g:rooter_silent_chdir = 1

" 自動切換根目錄
au BufLeave * Rooter
```

```vim
" nerdtree

" 顯示隱藏檔案
let g:NERDTreeShowHidden=1
" 不顯示的檔案
let NERDTreeIgnore = ['.DS_Store','^build$']

" 設定nerdtree位置
let g:NERDTreeWinPos='right'
" 設定nertree寬度
let g:NERDTreeWinSize=25
" 不顯示nerdtree的Press ? for help提醒
let NERDTreeMinimalUI=1
" 開啟檔案後關閉nerdtree
let NERDTreeQuitOnOpen=1

" 按下control+o鍵時，垂直分屏後開啟舊檔
let g:NERDTreeMapOpenVSplit='<C-o>'

" 重新映射快速鍵以釋放按鍵
let g:NERDTreeMapOpenSplit='xxxi'
let g:NERDTreeMapJumpNextSibling='xxxcj'
let g:NERDTreeMapJumpPrevSibling='xxxck'

" 按下control+n鍵時，切換nerdtree與vista.vim
function! NVtoggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
        Vista
    elseif exists("t:vista")
        Vista!
        NERDTreeVCS
    else
        NERDTreeVCS
    endif
endfunction
nnoremap <silent> <C-n> :call NVtoggle()<CR>
```

```vim
" LeaderF

" 設定LeaderF檔案所在目錄
let g:Lf_CacheDirectory=expand('~/.cache')
" 設定LeaderF搜尋所在專案之根目錄
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_RootMarkers=['.git']
let g:Lf_UseVersionControlTool=0
" 搜尋隱藏檔案
let g:Lf_ShowHidden=1
" 搜尋symlink插件
let g:Lf_FollowLinks=1
" 不搜尋的檔案與路徑
let g:Lf_WildIgnore = {
            \ 'dir': ['Library', 'Documents', 'Pictures', 'Music', 'Movies', 'Google Drive File Stream', 'Adobe', '.adobe', '.antigen', '.cache', '.config', '.docker', '.dotfiles', '.ipython', '.local', '.mitmproxy', '.node-gyp', '.npm', '.ssh', '.subversion', '.Trash', '.vim', 'bin', 'build', 'assets', 'dist', '.git', 'node_modules'],
            \ 'file': ['.DS_Store']
            \}

" 設定LeaderF高度
let g:Lf_WindowHeight=0.18
" 隱藏LeaderF的help提醒
let g:Lf_HideHelp=1
" 顯示模糊搜索文件的絕對路徑
let g:Lf_ShowRelativePath = 0
" 設定LeaderF主題
let g:Lf_StlSeparator = {'left':'', 'right': ''}

let g:Lf_StlPalette = {
            \   'stlName': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '81'
            \   },
            \   'stlCategory': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '141'
            \   },
            \   'stlFullPathMode': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '161'
            \   },
            \   'stlFuzzyMode': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '141'
            \   },
            \   'stlCwd': {
            \       'cterm': 'NONE',
            \       'ctermfg': '166',
            \       'ctermbg': '233'
            \   },
            \   'stlBlank': {
            \       'cterm': 'NONE',
            \       'ctermfg': 'NONE',
            \       'ctermbg': '233'
            \   },
            \   'stlLineInfo': {
            \       'cterm': 'NONE',
            \       'ctermfg': '161',
            \       'ctermbg': '233'
            \   },
            \   'stlTotal': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '161'
            \   }
            \ }

" 按下control+p鍵時，開啟模糊搜尋文件功能
function! LFtoggle()
    if exists("g:qfix_win")
        cclose
        wincmd h
        wincmd k
        LeaderfFile
        unlet g:qfix_win
    elseif exists("g:Topenflag")
        Tclose
        wincmd h
        wincmd k
        LeaderfFile
        unlet g:Topenflag
    else
        wincmd h
        wincmd k
        LeaderfFile
    endif
endfunction
nnoremap <silent> <C-p> :call LFtoggle()<CR>

" 配置快捷鍵
let g:Lf_CommandMap = {'<C-]>': ['<C-o>'], '<ESC>': ['<C-p>']}
```

```vim
" vista.vim

" 設定vista位置
let g:vista_sidebar_position = 'vertical'
" 設定vista寬度
let g:vista_sidebar_width = 25
" vista不顯示訊息
let g:vista_echo_cursor = 0
" 跳轉標籤後關閉vista
let g:vista_close_on_jump = 1
```

```vim
" easymotion

" 關閉預設映射
let g:EasyMotion_do_mapping = 0

" 關鍵字不分大小寫
let g:EasyMotion_smartcase = 1

" 啟動搜尋功能
nmap s <Plug>(easymotion-sn)
```

```vim
" vim-multiple-cursors

" 關閉預設映射
let g:multi_cursor_use_default_mapping=0

" 全選多光標關鍵字
let g:multi_cursor_select_all_word_key = '<S-a>'
" 離開多光標模式
let g:multi_cursor_quit_key = 'kj'

" 避開插件衝突
function Multiple_cursors_before()
    if exists("g:ycm_filetype_whitelist")
        let s:old_ycm_whitelist = g:ycm_filetype_whitelist
        let g:ycm_filetype_whitelist = {}
    endif
endfunction

function Multiple_cursors_after()
    if exists("g:ycm_filetype_whitelist")
        let g:ycm_filetype_whitelist = s:old_ycm_whitelist
    endif
endfunction

" 按下a鍵時，開始多光標編輯
vnoremap <silent> a c
```

```vim
" nerdcommenter

" 按下/+/鍵增刪註解
nmap <silent> // <plug>NERDCommenterToggle
vmap <silent> // <plug>NERDCommenterToggle
```

```vim
" vim-polyglot

" 語法禁用
let g:polyglot_disabled = ['markdown']
```

```vim
" vim-sublime-monokai

" 啟用monokai主題
colorscheme sublimemonokai
```

```vim
" lightline

" 設定狀態列高度
set laststatus=2

" 關閉多餘模式提醒
set noshowmode

" 啟用lightline的monokai主題
let g:lightline = {
            \   'colorscheme': 'molokai',
            \}
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}
```

```vim
" bufferline

" 使終端機不要出現在buffer列表
au TerminalOpen * set nobuflisted

" 使quickfix不要出現在buffer列表
au FileType qf set nobuflisted

" 顯示buffer列
set showtabline=2

" 顯示buffer名稱
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'

" 啟用bufferline主題
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" 按下shift+tab鍵時，跳轉到上一個buffer
nnoremap <silent> n :bpre<CR>
" 按下tab鍵時，跳轉到下一個buffer
nnoremap <silent> m :bnext<CR>
" 按下空白鍵+q+enter鍵時，關閉buffer或vim
function! Bye()
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        q
    else
        cclose
        Tclose
        bdelete
    endif
endfunction
nnoremap <silent> <SPACE>q :call Bye()
```

### 3.3. 命令

```vim
:PlugStatus " 查詢插件安裝與載入狀態

:PlugInstall 插件 " 安裝該插件
:PlugInstall " 安裝所有插件

:PlugUpgrade " 升級vim-plug
:PlugUpdate " 升級所有插件
```
