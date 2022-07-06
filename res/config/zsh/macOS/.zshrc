# zmodload zsh/zprof

# antigen啟用
source /opt/homebrew/share/antigen/antigen.zsh

# 安裝zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# 安裝zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# antigen啟用終點
antigen apply

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_FORCE_BREWED_CURL=1
export PIPENV_VENV_IN_PROJECT=1

autoload -U promptinit; promptinit
prompt pure

# zprof
