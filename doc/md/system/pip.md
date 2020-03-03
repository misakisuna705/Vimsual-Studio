# pip

<!-- vim-markdown-toc GFM -->

* [安裝](#安裝)
* [命令](#命令)

<!-- vim-markdown-toc -->

---

## 安裝

```zsh
brew install python # 安裝python（ pip ）
```

## 命令

```zsh
pip3 search 插件 # 搜尋某插件與其相關插件

pip3 list # 查詢已安裝插件清單

pip3 show pip # 查詢pip詳細資料
pip3 show 插件 # 查詢該插件詳細資料

pip3 install 插件 # 安裝該插件
pip3 install "插件<版本,>=版本" # 安裝該插件指定版本
pip3 uninstall 插件 # 解除安裝該插件

pip3 list --outdated # 表列過期插件

pip3 install -U pip # 升級pip
pip3 install -U 插件 # 升級該插件

pip3 check # 檢查插件版本相容性
```
