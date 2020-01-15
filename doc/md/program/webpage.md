# webpage

<!-- vim-markdown-toc GFM -->

* [1. 環境](#1-環境)
  - [1.1. yarn](#11-yarn)
    + [安裝](#安裝)
    + [命令](#命令)
  - [1.2. typescript](#12-typescript)
    + [安裝](#安裝-1)
    + [命令](#命令-1)
* [2. 補全](#2-補全)
  - [2.1. coc.nvim](#21-cocnvim)
    + [安裝](#安裝-2)
    + [配置](#配置)
    + [命令](#命令-2)
    + [插件](#插件)
    + [配置（ coc-settings.json ）](#配置-coc-settingsjson-)
  - [2.2. emmet-vim](#22-emmet-vim)
    + [安裝](#安裝-3)
    + [配置](#配置-1)
* [3. 偵錯](#3-偵錯)
  - [3.1. htmlhint](#31-htmlhint)
  - [3.2. stylelint](#32-stylelint)
    + [安裝](#安裝-4)
    + [配置（ .stylelintrc ）](#配置-stylelintrc-)
  - [3.3. stylelint-config-standard](#33-stylelint-config-standard)
  - [3.4. ale](#34-ale)
    + [安裝](#安裝-5)
    + [配置](#配置-2)
    + [命令](#命令-3)
* [4. 排版](#4-排版)
  - [4.1. prettier](#41-prettier)
  - [4.2. typescript-formatter](#42-typescript-formatter)
  - [4.3. vim-autoformat](#43-vim-autoformat)
    + [安裝](#安裝-6)
    + [配置](#配置-3)
* [5. 推播](#5-推播)
  - [5.1. del](#51-del)
  - [5.2. gulp](#52-gulp)
    + [安裝](#安裝-7)
    + [配置（ gulpfile.js ）](#配置-gulpfilejs-)
    + [命令](#命令-4)
  - [5.3. gulp-html-replace](#53-gulp-html-replace)
  - [5.4. gulp-htmlmin](#54-gulp-htmlmin)
  - [5.5. gulp-sass](#55-gulp-sass)
  - [5.6. gulp-clean-css](#56-gulp-clean-css)
  - [5.7. gulp-typescript](#57-gulp-typescript)
  - [5.8. gulp-concat](#58-gulp-concat)
  - [5.9. gulp-terser](#59-gulp-terser)
  - [5.10. browser-sync](#510-browser-sync)
  - [5.11. neoterm](#511-neoterm)
    + [安裝](#安裝-8)
    + [配置](#配置-4)
* [6. 發佈](#6-發佈)
  - [6.1. git](#61-git)
    + [.gitconfig](#gitconfig)
    + [.gitignore](#gitignore)
  - [6.2. vim-signify](#62-vim-signify)
    + [安裝](#安裝-9)
    + [配置](#配置-5)
  - [6.3. asyncrun.vim](#63-asyncrunvim)
    + [安裝](#安裝-10)
    + [配置](#配置-6)

<!-- vim-markdown-toc -->

---

## 1. 環境

### 1.1. yarn

#### 安裝

```zsh
brew install yarn # 安裝yarn
```

#### 命令

```zsh
yarn init # 該專案初始化環境
```

### 1.2. typescript

#### 安裝

```zsh
yarn global add typescript # 在全局安裝typescript
```

#### 命令

```zsh
tsc xxx.ts
```

## 2. 補全

### 2.1. coc.nvim

#### 安裝

```vim
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for':['html','css','scss','javascript','typescript','json','yaml']}
```

#### 配置

```vim
" 安裝coc插件
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-omnisharp']

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
coc-html
coc-css
coc-tsserver
coc-json
coc-yaml
```

#### 配置（ coc-settings.json ）

```zsh
{
    "coc.preferences.noselect": false,
    "coc.preferences.minTriggerInputLength": 2,
    "coc.preferences.diagnostic.enable": false
}
```

### 2.2. emmet-vim

#### 安裝

```vim
Plug 'mattn/emmet-vim', {'for':'html'} " 安裝emmet
```

#### 配置

```vim
" 按下Control+z+,鍵時，自動補全標籤
let g:user_emmet_leader_key='<C-z>'
```

## 3. 偵錯

### 3.1. htmlhint

```zsh
yarn global add htmlhint # 在全局安裝htmlhint
```

### 3.2. stylelint

#### 安裝

```zsh
yarn gobal add stylelint # 在全局安裝stylelint
```

#### 配置（ .stylelintrc ）

```zsh
{
    "extends": "/Users/misakisuna/Test/Test_Webpage/node_modules/stylelint-config-recommended"
}
```

### 3.3. stylelint-config-standard

```zsh
yarn gobal add stylelint-config-standard # 在全局安裝stylelint-config-standard
```

### 3.4. ale

#### 安裝

```vim
Plug 'w0rp/ale',{'on':'ALELint'} " 安裝ale
```

#### 配置

```vim
" 不進行實時偵錯，保存時才偵錯
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=0
au FileType html,css,scss,javascript,typescript
            \ au! BufWrite <buffer> ALELint

" 在quickfix顯示偵錯訊息
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" 設定linter
let g:ale_linters = {
            \   'html': ['htmlhint'],
            \   'css': ['stylelint'],
            \   'scss': ['stylelint'],
            \   'javascript': ['tsserver'],
            \   'typescript': ['tsserver'],
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

### 4.1. prettier

```zsh
yarn global add prettier # 在全局安裝prettier
```

### 4.2. typescript-formatter

```zsh
yarn global add typescript-formatter # 在全局安裝typescript-formatter
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

" 載入prettier排版web檔案
let g:formatters_html=['prettier']
let g:formatters_css = ['prettier']
let g:formatters_scss=['prettier']
let g:formatters_javascript=['prettier']
let g:formatters_typescript = ['tsfmt']

" 在web檔案中，按下tab鍵時，電腦顯示為2個空格(不一定辨認為space語法)
au FileType html,css,scss,javascript,json,yaml set softtabstop=2
" 在web檔案中，使用tab語法時，電腦顯示為2個空格
au FileType html,css,scss,javascript,json,yaml set tabstop=2
" 在web檔案中，使用tab語法時，電腦顯示為2個空格
au FileType html,css,scss,javascript,json,yaml set shiftwidth=2
```

## 5. 推播

### 5.1. del

```zsh
yarn global add del # 在全局安裝del
```

### 5.2. gulp

#### 安裝

```zsh
yarn global add gulp # 在全局安裝gulp
```

#### 配置（ gulpfile.js ）

```js
//system

const gulp = require("gulp");
const del = require("del");

//html

const gulp_html_replace = require("gulp-html-replace");
const gulp_htmlmin = require("gulp-htmlmin");

//css + scss

const gulp_sass = require("gulp-sass");
const gulp_clean_css = require("gulp-clean-css");

//js + ts

const gulp_typescript = require("gulp-typescript");
const gulp_concat = require("gulp-concat");
const gulp_terser = require("gulp-terser");

//browser

const browser_sync = require("browser-sync").create();

//src

const src = {
  html: "src/index.html",
  css: "src/**/*.css",
  scss: "src/**/*.scss",
  js: "src/**/*.js",
  ts: "src/**/*.ts",
  png: "src/**/*.png",
  mp3: "src/**/*.mp3",
  mp4: "src/**/*.mp4"
};

//build

const build = {
  html: "build/index.html",
  css: "build/**/*.css",
  js: "build/**/*.js"
};

//init

exports.default = gulp.series(
  clean,
  gulp.parallel(replace_html, mov_css, trans_scss, minify_js, trans_ts),
  gulp.parallel(minify_html, minify_css, concat_js, mov_png, mov_mp3, mov_mp4),
  init_server,
  watch
);

//system

function clean() {
  return del(["build/", "dist/"]);
}

//html

function replace_html() {
  return gulp
    .src(src.html)
    .pipe(gulp_html_replace({ js: "script.min.js" }))
    .pipe(gulp.dest("build/"));
}

function minify_html() {
  return gulp
    .src(build.html)
    .pipe(gulp_htmlmin())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

//css + scss

function mov_css() {
  return gulp.src(src.css).pipe(gulp.dest("build/"));
}

function trans_scss() {
  return gulp
    .src(src.scss)
    .pipe(gulp_sass())
    .pipe(gulp.dest("build/"));
}

function minify_css() {
  return gulp
    .src(build.css)
    .pipe(gulp_clean_css())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

//js + ts

function minify_js() {
  return gulp
    .src(src.js)
    .pipe(gulp_terser())
    .pipe(gulp.dest("build/"));
}

function trans_ts() {
  return gulp
    .src(src.ts)
    .pipe(gulp_typescript())
    .pipe(gulp_terser())
    .pipe(gulp.dest("build/"));
}

function concat_js() {
  return gulp
    .src(build.js)
    .pipe(gulp_concat("script.min.js"))
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

//assets

function mov_png() {
  return gulp
    .src(src.png)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_mp3() {
  return gulp
    .src(src.mp3)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_mp4() {
  return gulp
    .src(src.mp4)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function init_server(done) {
  browser_sync.init({
    server: "dist/"
  });

  browser_sync.use({
    plugin() {},
    hooks: {
      "client:js": "(function (bs) {bs.socket.on('disconnect', function (client) { window.close(); });})(___browserSync___);"
    }
  });

  done();
}

//browser

function watch() {
  gulp.watch(src.html, replace_html);
  gulp.watch(build.html, minify_html);

  gulp.watch(src.css, mov_css);
  gulp.watch(src.scss, trans_scss);
  gulp.watch(build.css, minify_css);

  gulp.watch(src.js, minify_js);
  gulp.watch(src.ts, trans_ts);
  gulp.watch(build.js, concat_js);
}
```

#### 命令

```zsh
gulp # 將webpage推播到瀏覽器
```

### 5.3. gulp-html-replace

```zsh
yarn global add gulp-html-replace # 在全局安裝gulp-html-replace
```

### 5.4. gulp-htmlmin

```zsh
yarn global add gulp-htmlmin # 在全局安裝gulp-htmlmin
```

### 5.5. gulp-sass

```zsh
yarn global add gulp-sass # 在全局安裝gulp-sass
```

### 5.6. gulp-clean-css

```zsh
yarn global add gulp-clean-css # 在全局安裝gulp-clean-css
```

### 5.7. gulp-typescript

```zsh
yarn global add gulp-typescript # 在全局安裝gulp-typescript
```

### 5.8. gulp-concat

```zsh
yarn global add gulp-concat # 在全局安裝gulp-concat
```

### 5.9. gulp-terser

```zsh
yarn global add gulp-terser # 在全局安裝gulp-terser
```

### 5.10. browser-sync

```zsh
yarn global add browser-sync # 在全局安裝browser-sync
```

### 5.11. neoterm

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

" 按下F1鍵時，推播html文件
function ExeWeb()
    if exists("g:qfix_win")
        cclose
        let save_view = winsaveview()
        Tclear
        Topen
        let g:Topenflag=1
        Tclear
        T gulp
        call winrestview(save_view)
        unlet g:qfix_win
    else
        cclose
        let save_view = winsaveview()
        Topen
        let g:Topenflag=1
        Tclear
        T gulp
        call winrestview(save_view)
    endif
endfunction
au FileType html nnoremap <silent> <F1> :call ExeWeb()<CR>

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

" 按下F2鍵時，停止推播html文件
au FileType html nnoremap <silent> <F2> :Tkill<CR>

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

```vim
Plug 'mhinz/vim-signify' " 安裝vim-signify
```

#### 配置

```vim
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
