# brew

<!-- vim-markdown-toc GFM -->

* [cellar](#cellar)
    - [安裝](#安裝)
    - [命令](#命令)
* [cask](#cask)
    - [安裝](#安裝-1)
    - [命令](#命令-1)
* [font](#font)

<!-- vim-markdown-toc -->

---

## cellar

### 安裝

```zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # 安裝brew
```

### 命令

```zsh
brew search 插件 # 搜尋某插件與其相關插件

brew list # 查詢已安裝插件清單

brew info # 查詢已安裝插件數量與大小
brew info 插件 # 查詢該插件詳細資料

brew install 插件 # 安裝該插件
brew uninstall 插件 # 解除安裝該插件

brew update # 更新brew源同時表列過期插件

brew upgrade 插件 # 升級該插件
brew upgrade # 升級所有插件

brew cleanup # 清理暫存檔

brew doctor # 檢查brew

brew bundle # 從Brewfile安裝cellar / cask / font
brew bundle dump # 生成Brewfile
brew bundle dump --force # 複寫Brewfile

brew link # 串連命令與插件
brew unlink # 斷開命令與插件
```

## cask

### 安裝

```zsh
brew tap caskroom/cask # 安裝caskroom/cask
```

### 命令

```zsh
brew cask list # 查詢已安裝程式清單

brew cask info 程式 # 查詢該程式詳細資料

brew cask install 程式 # 安裝該程式
brew cask uninstall 程式 # 解除安裝該程式

brew cask upgrade 程式 # 升級該程式
brew cask upgrade # 升級所有程式
```

## font

```zsh
brew tap caskroom/fonts # 安裝caskroom/fonts
```
