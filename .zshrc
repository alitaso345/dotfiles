export EDITOR=vim
eval "$(direnv hook zsh)"

# プロンプトの表示
PROMPT="[%n@]"

#PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/postgres:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

#go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

#alias
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gcv='git commit --verbose'
alias gs='git status -sb'
alias gr='git rebase -i'
alias gd='git diff'
alias gp='git push'

eval "$(rbenv init - zsh)" #rbenvのpath
eval "$(direnv hook zsh)" #dierenvのpath

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

#Emacsキーバインドを使用
bindkey -e

#補完機能を有効にする
autoload -Uz compinit
compinit

#ディレクトリ移動に関する設定
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS


#単語の区切り設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-chars unspecified

#補完時にメニュー選択モードを使う
zstyle ':completion:*:default' menu select=2

#大文字小文字を区別せずに補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
setopt hist_ignore_all_dups #古いコマンドは削除
setopt hist_reduce_blanks #余分な空白は詰めて記録
setopt hist_save_no_dups #古いコマンドと同じものは無視
setopt hist_ignore_space #スペースから始めるコマンド行はリストから削除

#antigen
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-syntax-highlighting #zhsのシンタックスハイライト
  antigen apply
fi

#peco
## ghqによるリポジトリ移動
bindkey '^]' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

## コマンド履歴移動
bindkey '^R' peco-history-selection
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-history-selection

## gitブランチの移動
bindkey '^[' peco-git-checkout
function peco-git-checkout() {
  git branch -a --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/###' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
  zle clear-screen
}
zle -N peco-git-checkout

## ファイル履歴移動
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

bindkey '^V' peco-cdr
function peco-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alitaso/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alitaso/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alitaso/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alitaso/google-cloud-sdk/completion.zsh.inc'; fi
