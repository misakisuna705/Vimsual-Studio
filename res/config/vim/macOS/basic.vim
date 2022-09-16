" ==================================================================================================================== "

" 插件安裝

" ==================================================================================================================== "

" 瀏覽插件
Plug 'airblade/vim-rooter'
Plug 'skywind3000/vim-quickui'
Plug 'Yggdroot/LeaderF', {'on': 'LeaderfFile', 'do': './install.sh'}
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeVCS', 'NERDTreeClose']}
Plug 'liuchengxu/vista.vim', {'on': ['Vista', 'Vista!']}
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/vim-cppman', {'on': 'Cppman'}
Plug 'easymotion/vim-easymotion', {'on': '<Plug>(easymotion-sn)'}
Plug 'mhinz/vim-signify'

" ==================================================================================================================== "

" 插件配置

" ==================================================================================================================== "

" airblade/vim-rooter

" 切換根目錄時不顯示訊息
let g:rooter_silent_chdir = 1

" =========================================================== "

" skywind3000/vim-quickui

let share = [
            \ [ 'push to github', 'call Push_Github()' ],
            \ [ 'publish to npm', 'call Publish_Npm()' ],
            \ [ 'deploy to firebase', 'call Deploy_Firebase()' ],
            \ ]

let goto = [
            \ [ 'find keyword', 'Leaderf rg' ],
            \ [ 'find definition', 'exec "Leaderf gtags --path-style absolute -d " . expand("<cword>")' ],
            \ [ 'find reference', 'exec "Leaderf gtags --path-style absolute -r " . expand("<cword>")' ],
            \ ]

" 搜尋標籤
nnoremap <silent> <C-f> :call quickui#context#open(goto, {'index':0})<CR>
" 預覽標籤
nnoremap <S-m> :call quickui#tools#preview_tag('')<CR>
nnoremap <S-h> :call quickui#preview#scroll(-1)<CR>
nnoremap <S-n> :call quickui#preview#scroll(1)<CR>
" 發布專案
nnoremap <silent> <F12> :call quickui#listbox#open(share, {})<CR>

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
            \ 'dir': ['.cache', '.Trash', 'Documents', 'Music', 'Desktop', 'Pictures', 'Movies', 'Cache', '*Google Drive', 'Server', 'bin', 'Library', 'node_modules', '.git', '.venv', 'build', 'dist'],
            \ 'file': ['._*', '.DS_Store', '._.DS_Store']
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
let g:Lf_CommandMap = {'<C-]>': ['<C-o>'], '<C-t>': ['<CR>'], '<ESC>': ['<C-p>', '<C-f>', '<ESC>'], '<C-p>': ['<C-n>']}

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

" liuchengxu/vista.vim

" 設定vista位置
let g:vista_sidebar_position = 'vertical'
" 設定vista寬度
let g:vista_sidebar_width = 25
" vista不顯示訊息
let g:vista_echo_cursor = 0
" 跳轉標籤後關閉vista
let g:vista_close_on_jump = 1

" =========================================================== "

" ludovicchabant/vim-gutentags

" 顯示標籤詳細資料
" let g:gutentags_trace = 1

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

" =========================================================== "

" skywind3000/vim-cppman

" 設定manual開啟位置
let g:cppman_open_mode = "vertical"

" 按下q鍵時，開啟cppman
au FileType cpp nnoremap q :Cppman <C-r><C-w><CR>
au FileType c nnoremap q :Cppman! 3 <C-r><C-w><CR>
au FileType c nnoremap <S-q> :Cppman! 2 <C-r><C-w><CR>

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
