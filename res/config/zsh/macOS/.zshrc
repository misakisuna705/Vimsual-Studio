# zmodload zsh/zprof

# antigen啟用
source /usr/local/share/antigen/antigen.zsh

# 安裝pure主題
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# 安裝zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# 安裝zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# antigen啟用終點
antigen apply

export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_FORCE_BREWED_CURL=1
export PIPENV_VENV_IN_PROJECT=1

# zprof
