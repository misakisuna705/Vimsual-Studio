# zsh

<!-- vim-markdown-toc GFM -->

* [1. 設定](#1-設定)
* [2. 插件](#2-插件)
    - [2.1. 安裝](#21-安裝)
    - [2.2. 配置](#22-配置)
    - [2.3. 命令](#23-命令)

<!-- vim-markdown-toc -->

---

## 1. 設定

```zsh
chsh -s /bin/zsh # 將shell設定為zsh
```

## 2. 插件

### 2.1. 安裝

```zsh
brew install antigen # 安裝antigen
```

### 2.2. 配置

```zsh
# antigen 啟用
source /usr/local/share/antigen/antigen.zsh

# 安裝 pure
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# 安裝 zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# 安裝zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# antigen 啟用終點
antigen apply
```

### 2.3. 命令

```zsh
antigen list # 查詢已安裝插件清單

antigen update 插件 # 安裝該插件

antigen update # 升級所有插件

antigen reset # 重設所有插件
```
