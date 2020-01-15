# yarn

<!-- vim-markdown-toc GFM -->

* [1. 安裝](#1-安裝)
* [2. 命令](#2-命令)
* [3. 插件](#3-插件)

<!-- vim-markdown-toc -->

---

## 1. 安裝

```zsh
brew install yarn # 安裝yarn
```

## 2. 命令

```zsh
npm search 插件 # 搜尋某插件與其相關插件

yarn global list # 查詢全局已安裝插件清單

yarn global add 插件 # 在全局安裝該插件
yarn global remove 插件 # 在全局解除安裝該插件

yarn global upgrade # 在全局升級所有插件
yarn global upgrade 插件 # 在全局升級該插件

yarn add 插件 # 在區域安裝該插件
yarn remove 插件 # 在區域解除安裝該插件
yarn upgrade # 在區域升級所有插件
yarn upgrade 插件 # 在區域升級該插件

yarn install # 用package.json安裝插件

yarn cache clean # 清理暫存檔
```

## 3. 插件

```json
{
  "dependencies": {
    "browser-sync": "^x.x.x",
    "del": "^x.x.x",
    "firebase-tools": "^x.x.x,
    "gulp": "^x.x.x",
    "gulp-clean-css": "^x.x.x",
    "gulp-concat": "^x.x.x",
    "gulp-html-replace": "^x.x.x",
    "gulp-htmlmin": "^x.x.x",
    "gulp-sass": "^x.x.x",
    "gulp-terser": "^x.x.x",
    "gulp-typescript": "^x.x.x",
    "htmlhint": "^x.x.x",
    "prettier": "^x.x.x",
    "stylelint": "^x.x.x",
    "stylelint-config-standard": "^x.x.x",
    "typescript": "^x.x.x",
    "typescript-formatter": "^x.x.x"
  }
}
```
