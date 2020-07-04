" ==================================================================================================================== "

" 插件安裝

" ==================================================================================================================== "

" junegunn/vim-plug

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

" =========================================================== "

" 插件開始位置
call plug#begin('~/.vim/plugged')

" 瀏覽插件
Plug 'airblade/vim-rooter'
Plug 'Yggdroot/LeaderF', {'on': 'LeaderfFile', 'do': './install.sh'}
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeVCS', 'NERDTreeClose']}
Plug 'easymotion/vim-easymotion', {'on': '<Plug>(easymotion-sn)'}
Plug 'mhinz/vim-signify'

" 編輯插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'scrooloose/nerdcommenter', {'on': '<plug>NERDCommenterToggle'}

" 補全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim', {'for': 'html'}

" 排版插件
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}

" 建構插件
Plug 'kassio/neoterm', {'on': ['T', 'Topen', 'Tclose', 'Tclear']}

" 主題插件
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'

" 插件啟用終點
call plug#end()

" ==================================================================================================================== "

" 插件配置

" ==================================================================================================================== "

" airblade/vim-rooter
" 切換根目錄時不顯示訊息
let g:rooter_silent_chdir = 1

" =========================================================== "

" Yggdroot/LeaderF

" 使用gtags
let g:Lf_GtagsAutoGenerate = 1
" 使用popup模式
let g:Lf_WindowPosition = 'popup'
" 設定leaderF開檔覆蓋空buffer
let g:Lf_DiscardEmptyBuffer = 1
" 設定LeaderF檔案所在目錄
let g:Lf_CacheDirectory = expand('~/.cache')
" 設定LeaderF搜尋所在專案之根目錄
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RootMarkers = ['.git']
let g:Lf_UseVersionControlTool = 0
" 搜尋隱藏檔案
let g:Lf_ShowHidden = 1
" 搜尋symlink插件
let g:Lf_FollowLinks = 1
" 不搜尋的檔案與路徑
let g:Lf_WildIgnore = {
            \ 'dir': ['.adobe', '.android', '.antigen', '.cache', '.config', '.dotfiles', '.dotnet', '.gradle', '.local', '.mitmproxy', '.mono', '.node-gyp', '.npm', '.nuget', '.omnisharp', '.oracle_jre_usage', '.ssh', '.subversion', '.swt', '.templateengine', '.Trash', '.vim', 'Documents', 'Music', 'Desktop', 'Pictures', 'Movies', 'Applications', 'Applications (Parallels)', 'Cache', 'go', 'Google Drive File Stream', 'bin', 'Library', 'node_modules', 'Server', 'temp', '.git', 'build', 'dist'],
            \ 'file': ['.DS_Store', '._.DS_Store']
            \}

" 隱藏LeaderF的help提醒
let g:Lf_HideHelp = 1
" 隱藏LeaderF的圖標
let g:Lf_ShowDevIcons = 0
" 顯示模糊搜索文件的絕對路徑
let g:Lf_ShowRelativePath = 0
" 設定主視窗
let g:Lf_PopupHeight = 0.23
let g:Lf_PopupWidth = &columns * 0.8
" 設定預覽視窗
let g:Lf_PreviewInPopup = 1

" 設定LeaderF主題
let g:Lf_StlSeparator = {'left': '', 'right': ''}

let g:Lf_StlPalette = {
            \   'stlName': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '81'
            \   },
            \
            \   'stlCategory': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '141'
            \   },
            \
            \   'stlFullPathMode': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '161'
            \   },
            \
            \   'stlFuzzyMode': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '141'
            \   },
            \
            \   'stlCwd': {
            \       'cterm': 'NONE',
            \       'ctermfg': '166',
            \       'ctermbg': '233'
            \   },
            \
            \   'stlBlank': {
            \       'cterm': 'NONE',
            \       'ctermfg': 'NONE',
            \       'ctermbg': '233'
            \   },
            \
            \   'stlLineInfo': {
            \       'cterm': 'NONE',
            \       'ctermfg': '161',
            \       'ctermbg': '233'
            \   },
            \
            \   'stlTotal': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '161'
            \   }
            \ }

let g:Lf_PopupPalette = {
            \   'dark': {
            \       'Lf_hl_popup_inputText': {
            \           'cterm': 'NONE',
            \           'ctermfg': 'NONE',
            \           'ctermbg': '0'
            \       },
            \
            \       'Lf_hl_popup_window': {
            \           'cterm': 'NONE',
            \           'ctermfg': '255',
            \           'ctermbg': '0'
            \       },
            \
            \       'Lf_hl_popup_category': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '141'
            \       },
            \
            \       'Lf_hl_popup_inputMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '81'
            \       },
            \
            \       'Lf_hl_popup_fullPathMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '161'
            \           },
            \
            \       'Lf_hl_popup_fuzzyMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '141'
            \       },
            \
            \       'Lf_hl_popup_normalMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '81'
            \       },
            \
            \       'Lf_hl_popup_blank': {
            \           'cterm': 'NONE',
            \           'ctermfg': 'NONE',
            \           'ctermbg': '233'
            \       },
            \
            \       'Lf_hl_popup_lineInfo': {
            \           'cterm': 'NONE',
            \           'ctermfg': '161',
            \           'ctermbg': '233'
            \       },
            \
            \       'Lf_hl_popup_total': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '161'
            \       },
            \
            \       'Lf_hl_popup_cwd': {
            \           'cterm': 'NONE',
            \           'ctermfg': '166',
            \           'ctermbg': '233'
            \       }
            \   }
            \ }

" 搜尋文件
nnoremap <silent> <C-p> :LeaderfFile<CR>
" 其他快捷鍵
let g:Lf_CommandMap = {'<C-]>': ['<C-o>'], '<C-t>': ['<CR>'], '<ESC>': ['<C-p>', '<C-f>'], '<C-p>': ['<C-n>']}

" =========================================================== "

" scrooloose/nerdtree

" 顯示隱藏檔案
let g:NERDTreeShowHidden = 1
" 不顯示的檔案
let NERDTreeIgnore = ['.DS_Store', '^build$']

" 設定nerdtree位置
let g:NERDTreeWinPos = 'right'
" 設定nertree寬度
let g:NERDTreeWinSize = 25
" 不顯示nerdtree的Press ? for help提醒
let NERDTreeMinimalUI = 1
" 開啟檔案後關閉nerdtree
let NERDTreeQuitOnOpen = 1

" 按下control+o鍵時，垂直分屏後開啟舊檔
let g:NERDTreeMapOpenVSplit = '<C-o>'
let g:NERDTreeCustomOpenArgs = {'file': {'where': 't'}}
" 重新映射快速鍵以釋放按鍵
let g:NERDTreeMapOpenSplit = 'xxxi'
let g:NERDTreeMapJumpNextSibling = 'xxxcj'
let g:NERDTreeMapJumpPrevSibling = 'xxxck'

" 按下control+n鍵時，切換nerdtree與vista.vim
nnoremap <silent> <C-n> :call NVtoggle()<CR>

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

" =========================================================== "

" easymotion/vim-easymotion

" 關閉預設映射
let g:EasyMotion_do_mapping = 0

" 關鍵字不分大小寫
let g:EasyMotion_smartcase = 1

" 啟動搜尋功能
nmap s <Plug>(easymotion-sn)

" =========================================================== "

" mhinz/vim-signify

" 按下shift+f鍵時，跳轉signify
nnoremap <silent> <expr> <plug>(sy-hunk-next) &diff
            \ ? ']c'
            \ : ":\<c-u>call <sid>signify_hunk_next(v:count1)\<cr>"
nmap <S-f> <plug>(sy-hunk-next)

function! s:signify_hunk_next(count) abort
    let oldpos = getcurpos()
    call sy#jump#next_hunk(a:count)
    if getcurpos() == oldpos
        call sy#jump#prev_hunk(9999)
    endif
endfunction

" ==================================================================================================================== "

" mg979/vim-visual-multi

" 游標復位
let g:VM_reselect_first = 1

" 關閉預設訊息
let g:VM_set_statusline = 0
let g:VM_silent_exit = 1

" 關閉預設映射
let g:VM_default_mappings = 0
let g:VM_maps = {}

" 全選多光標關鍵字
let g:VM_maps['Visual All']  = '<S-a>'
let g:VM_maps['Find Under']  = ''
let g:VM_maps['Find Subword Under']  = ''
" 離開多光標模式
fun! VM_Start()
    nmap <buffer> <C-C> <Esc>
    imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
    nunmap <buffer> <C-C>
    iunmap <buffer> <C-C>
endfun
" 按下a鍵時，開始多光標編輯
let g:VM_maps['c'] = 'a'

" =========================================================== "

" scrooloose/nerdcommenter

" 按下/+/鍵增刪註解
nmap <silent> // <plug>NERDCommenterToggle
vmap <silent> // <plug>NERDCommenterToggle

" ==================================================================================================================== "

" neoclide/coc.nvim

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

" =========================================================== "

" mattn/emmet-vim

" 按下Control+z+,鍵時，自動補全標籤
let g:user_emmet_leader_key = '<C-z>'

" ==================================================================================================================== "

" Chiel92/vim-autoformat

" 顯示格式化詳細資料
" let g:autoformat_verbosemode=1

" 按下空白鍵+e時，自動排版
nnoremap <silent> <SPACE>e :Autoformat

" 在web檔案中，按下tab鍵時，電腦顯示為2個空格(不一定辨認為space語法)
au FileType html,css,javascript,json,yaml set softtabstop=2
" 在web檔案中，使用tab語法時，電腦顯示為2個空格
au FileType html,css,javascript,json,yaml set tabstop=2
" 在web檔案中，使用tab語法時，電腦顯示為2個空格
au FileType html,css,javascript,json,yaml set shiftwidth=2
" 在swift檔案中，按下tab鍵時，電腦顯示為4個空格(不一定辨認為space語法)
au FileType swift set softtabstop=4
" 在swift檔案中，使用tab語法時，電腦顯示為4個空格
au FileType swift set tabstop=4
" 在swift檔案中，使用tab語法時，電腦顯示為4個空格
au FileType swift set shiftwidth=4

" ==================================================================================================================== "

" kassio/neoterm

" 設定neoterm位置
let g:neoterm_default_mod = 'botright'

" 設定neoterm高度
let g:neoterm_size = 8

" 標記終端機的空白鍵和換行符
hi NonText ctermfg=242 ctermbg=NONE
au TerminalOpen * set list listchars=space:_

" 按下空白鍵+q+enter鍵時，關閉終端機
tnoremap <silent> <SPACE>q exit

" ==================================================================================================================== "

" sheerun/vim-polyglot

" 語法禁用
let g:polyglot_disabled = ['markdown']

" =========================================================== "

" itchyny/lightline.vim

" 顯示tab列
set showtabline=2
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

" 按下n鍵時，跳轉到上一個tab
nnoremap <silent> n :tabN<CR>
" 按下m鍵時，跳轉到下一個tab
nnoremap <silent> m :tabn<CR>

" 按下空白鍵+q+enter鍵時，關閉tab或vim
nnoremap <silent> <SPACE>q :q

" =========================================================== "

" ErichDonGubler/vim-sublime-monokai

" 啟用monokai主題
colorscheme sublimemonokai

" ==================================================================================================================== "

" 環境配置

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

" =========================================================== "

" 主題配置

" vim背景使用iterm
hi Normal ctermbg=NONE

" popmenu背景使用灰色
hi PMenu ctermfg=255 ctermbg=237
hi PMenuSbar ctermfg=NONE ctermbg=237
hi PmenuThumb ctermfg=NONE ctermbg=237

" 自動顯示sign欄位
set signcolumn=yes
" sign欄位去背
hi signcolumn ctermbg=None
hi SignifySignAdd    cterm=bold ctermbg=None ctermfg=119
hi SignifySignDelete cterm=bold ctermbg=None ctermfg=167
hi SignifySignChange cterm=bold ctermbg=None ctermfg=227

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

" =========================================================== "

" 映射配置

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

" 按下shift+u鍵時，重做上一個動作
nnoremap <S-u> <C-r>
" 按下enter鍵時，在普通模式新增空白行
nnoremap <CR> o<ESC>
" 按下{+enter鍵時，自動換行縮進補全}
inoremap {<CR> {<CR>}<ESC><UP>$<LEFT><LEFT>
" 按下begin+enter鍵時，自動換行縮進補全end
au filetype vlang inoremap begin<cr> begin<cr>end<esc><up>$<left><left><left><left><left><left>
" 按下(+enter鍵時，自動換行縮進補全)
au filetype vlang inoremap (<cr> (<cr>);<esc><up>o

" ==================================================================================================================== "

