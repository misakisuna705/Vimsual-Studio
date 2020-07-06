# zmodload zsh/zprof

# antigen啟用
source /home/linuxbrew/.linuxbrew/Cellar/antigen/2.2.3/share/antigen/antigen.zsh

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
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1
export PIPENV_VENV_IN_PROJECT=1

# zprof
