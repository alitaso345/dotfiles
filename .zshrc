# プロンプトの表示
PROMPT="[%n@]"

#PATH
export PATH=/usr/local/bin:$PATH

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

##すでに入力した内容を使って履歴を検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
history-search-end
bindkey "^o" history-beginning-search-backward-end

#cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

#Antigen
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle mollifier/anyframe
  antigen apply
fi

#anyframe-widget
bindkey '^v' anyframe-widget-cdr #過去に移動したディレクトリに移動
bindkey '^o^o' anyframe-widget-checkout-git-branch #Gitブランチを切り替える
bindkey '^r' anyframe-widget-execute-history #コマンド履歴から選んで実行
bindkey '^r^r' anyframe-widget-put-history #コマンド履歴から選んで選択
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

#peco
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
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/postgres:$PATH"
