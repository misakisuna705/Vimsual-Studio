# zsh

<!-- vim-markdown-toc GFM -->

* [1. 設定](#1-設定)
* [2. 插件](#2-插件)
    - [2.1. 安裝](#21-安裝)
    - [2.2. 配置](#22-配置)

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

# antigen 啟用終點
antigen apply
```
