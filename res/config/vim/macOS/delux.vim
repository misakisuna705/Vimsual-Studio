" ==================================================================================================================== "

" 插件安裝

" ==================================================================================================================== "

" 編輯插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'scrooloose/nerdcommenter', {'on': '<plug>NERDCommenterToggle'}

" 補全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim', {'for': ['html', 'js']}

" 偵錯插件
Plug 'dense-analysis/ale', {'for': ['c', 'cpp', 'cmake', 'python', 'swift', 'html', 'css', 'javascript', 'typescript', 'verilog_systemverilog', 'sh']}
Plug 'puremourning/vimspector', {'for': ['c', 'cpp'], 'do': './install_gadget.py --enable-c'}

" 排版插件
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'fisadev/vim-isort', {'on': 'Isort'}
Plug 'mzlogin/vim-markdown-toc', {'on': ['GenTocGFM', 'RemoveToc']}
Plug 'vhda/verilog_systemverilog.vim'

" 建構插件
Plug 'iamcco/markdown-preview.vim', {'on': '<Plug>MarkdownPreview'}
Plug 'iamcco/mathjax-support-for-mkdp', {'on': '<Plug>MarkdownPreview'}
Plug 'kassio/neoterm', {'on': ['T', 'Topen', 'Tclose', 'Tclear']}

" ==================================================================================================================== "

" 插件配置

" ==================================================================================================================== "

" mg979/vim-visual-multi

" 游標復位
let g:VM_reselect_first = 1

" 關閉預設訊息
let g:VM_set_statusline = 0
let g:VM_silent_exit = 1

" 區分大小寫
let g:VM_case_setting = 'sensitive'

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

" 安裝coc插件
let g:coc_global_extensions = ['coc-clangd', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-omnisharp', 'coc-sourcekit']

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

" dense-analysis/ale

" 設定偵錯時機
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" 設定linter參數
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_python_flake8_options = '--ignore=E501,E302,E225,E226,E251,E201,E305,E711,E117,E101,F403,F405,W191,W291,W293'
let g:ale_verilog_iverilog_options = '-Wno-sensitivity-entire-array'

" 設定linter
let g:ale_linters = {
            \   'c': ['clang', 'cppcheck'],
            \   'cpp': ['clang', 'cppcheck'],
            \   'cmake': ['cmakelint'],
            \   'python': ['flake8'],
            \   'swift': ['swiftlint'],
            \   'html': ['htmlhint'],
            \   'css': ['stylelint'],
            \   'javascript': ['tsserver'],
            \   'typescript': ['tsserver'],
            \   'verilog_systemverilog': ['iverilog'],
            \   'sh': ['shellcheck']
            \}

" 設定ale偵錯顯示格式
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" 設定符號
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 符號背景使用iterm
hi clear ALEErrorSign
hi clear ALEWarningSign
" 標示背景使用底線
hi ALEWarning cterm=underline
hi ALEError cterm=underline

" 按下f鍵時，跳轉偵錯訊息
nmap f <Plug>(ale_next_wrap)

" ==================================================================================================================== "

" Chiel92/vim-autoformat

" 顯示格式化詳細資料
let g:autoformat_verbosemode=1

" 預設不自動縮排
let g:autoformat_autoindent = 0

" 按下空白鍵+e時，自動排版
nnoremap <silent> <SPACE>e :Autoformat

" 設定排版工具
let g:formatdef_clangformat = "(" . "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{BasedOnStyle: google, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'" . ")"
let g:formatter_yapf_style = 'google'
let g:formatters_html = ['prettier']
let g:formatters_swift = '"swiftformat"'

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

" =========================================================== "

" fisadev/vim-isort

" 檔案保存時，自動排版
au BufWrite *.py :Isort

" =========================================================== "

" mzlogin/vim-markdown-toc

" 生成github格式目錄
let g:vmt_fence_hidden_markdown_style = 'GFM'
" 優化目錄語法
let g:vmt_cycle_list_item_markers = 1

" 按下F3鍵時，生成目錄
au FileType markdown nnoremap <F3> :GenTocGFM<CR>
" 按下F4鍵時，刪去目錄
au FileType markdown nnoremap <F4> :RemoveToc<CR>

" ==================================================================================================================== "

" iamcco/markdown-preview.vim

" 推播檔案
au FileType markdown nmap <F1> <Plug>MarkdownPreview
" 關閉推播
au FileType markdown nmap <F2> <Plug>StopMarkdownPreview

" =========================================================== "

" kassio/neoterm

" 設定neoterm位置
let g:neoterm_default_mod = 'botright'

" 設定neoterm高度
let g:neoterm_size = 8

" 標記終端機的空白鍵和換行符
hi NonText ctermfg=242 ctermbg=NONE
au TerminalOpen * set list listchars=space:_

" 建構c/cpp專案發行版
" au FileType c,cpp nnoremap <silent> <F1> :Tclear<CR>:T cmake . -GNinja -DCMAKE_BUILD_TYPE=Release -Bbuild/release && ninja -C ./build/release<CR>
" 建構c/cpp專案測試版
au FileType c,cpp nnoremap <silent> <F2> :Tclear<CR>:T cmake . -GNinja -DCMAKE_BUILD_TYPE=Debug -Bbuild/test && ninja -C ./build/test<CR>
" 執行c/cpp專案
au FileType c,cpp nnoremap <silent> <F3> :Tclear<CR>:T [ "$(ls data/)" ] && test/main < data/*.* \|\| test/main<CR>

" 按下F1鍵時，直譯該行
au FileType python nnoremap <silent> <F1> :Tclear<CR>:TREPLSendLine<CR>
" 按下F2鍵時，直譯多行
au FileType python vnoremap <silent> <F2> :Tclear<CR>:TREPLSendSelection<CR>
" 按下F3鍵時，直譯python文件
au FileType python nnoremap <silent> <F3> :Tclear<CR>:TREPLSendFile<CR>

" 按下F1鍵時，推播webpage專案
au FileType html nnoremap <silent> <F1> :call Run_Web()<CR>
" 按下F2鍵時，停止推播webpage專案
au FileType html nnoremap <silent> <F2> :Tkill<CR>

" 按下F1鍵時，推播react專案
au FileType javascript nnoremap <silent> <F1> :call Run_React()<CR>
" 按下F2鍵時，停止推播react專案
au FileType javascript nnoremap <silent> <F2> :Tkill<CR>

" 建構verilog專案發行版
au FileType verilog_systemverilog nnoremap <silent> <F1> :Tclear<CR>:T iverilog -o main main.v<CR>
" 執行verilog專案
au FileType verilog_systemverilog nnoremap <silent> <F2> :Tclear<CR>:T vvp main<CR>
" 調試verilog專案
au FileType verilog_systemverilog nnoremap <silent> <F3> :Tclear<CR>:T open -a gtkwave main.vcd<CR>

" 按下空白鍵+q+enter鍵時，關閉終端機
tnoremap <silent> <SPACE>q exit

function! Run_Web()
    Tclear
    T gulp
endfunction

function! Run_React()
    Tclear
    T yarn start
endfunction

function! Push_Github()
    Tclear
    T git add . && git commit -m "commit" && git push
endfunction

function! Publish_Npm()
    Tclear
    T npm publish
endfunction

function! Deploy_Firebase()
    Tclear
    firebase deploy
endfunction

" =========================================================== "

" puremourning/vimspector

" 主題配置
sign define vimspectorBP text=🚩 texthl=Normal
sign define vimspectorPC text=👉 texthl=Normal

" 按下F4鍵時，開始調試
"au FileType c,cpp nnoremap <silent> <F4> :call vimspector#AddFunctionBreakpoint("main")<CR>:call vimspector#LaunchWithSettings(#{configuration: "lldb-vscode"})<CR>
au FileType c,cpp nnoremap <silent> <F4> :call vimspector#AddFunctionBreakpoint("main")<CR>:call vimspector#LaunchWithSettings(#{configuration: "vscode-cpptools"})<CR>
" 按下F5鍵時，設置斷點
au FileType c,cpp nnoremap <silent> <F5> :call vimspector#ToggleBreakpoint()<CR>
" 按下F6鍵時，清除斷點
au FileType c,cpp nnoremap <silent> <F6> :call vimspector#ToggleBreakpoint()<CR>
" 按下F7鍵時，執行調試
au FileType c,cpp nnoremap <silent> <F7> :call vimspector#Restart()<CR>
" 按下F8鍵時，繼續調試
au FileType c,cpp nnoremap <silent> <F8> :call vimspector#Continue()<CR>
" 按下F9鍵時，單步繼續
au FileType c,cpp nnoremap <silent> <F9> :call vimspector#StepOver()<CR>
" 按下F10鍵時，單步進入
au FileType c,cpp nnoremap <silent> <F10> :call vimspector#StepInto()<CR>
" 按下F11鍵時，結束調試
au FileType c,cpp nnoremap <silent> <F11> :call vimspector#ClearBreakpoints()<CR>:call vimspector#Stop()<CR>:VimspectorReset<CR>

" ==================================================================================================================== "
