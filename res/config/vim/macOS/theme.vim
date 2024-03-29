" ==================================================================================================================== "

" 插件安裝

" ==================================================================================================================== "

" 主題插件
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'

" ==================================================================================================================== "

" 插件配置

" ==================================================================================================================== "

" itchyny/lightline.vim

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

" ==================================================================================================================== "
