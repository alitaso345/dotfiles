source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@\w]$(__git_ps1 "(\[\033[32m\]%s\[\033[0m\])")\$ '

#PATH
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="/usr/local/Cellar/git/2.9.0/bin:$PATH"

export EDITOR="/usr/local/bin/vim"
eval "$(direnv hook bash)"

#alias
alias ga='git add'
alias gc='git commit'
alias gcv='git commit --verbose'
alias gs='git status -sb'
alias gr='git rebase -i'
alias gd='git diff'
alias gp='git push'
