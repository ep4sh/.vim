stty icrnl
alias python='python3'
alias c='clear'
alias g='git'
alias k='kubectl'
alias mk='minikube'
alias drc='docker rm $(docker  ps -a -q)'
alias dri='docker rmi $(docker  images)'
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/.rvm/bin"
export ZSH="$HOME/.oh-my-zsh"
export TERM=linux

tmuxssh () {ssh -t $1 tmux ;}
cleartf () {fd .terragrunt-cache --type d --hidden --no-ignore --exec rm -rf}
rvme    () {source /$HOME/.rvm/scripts/rvm}

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

ZSH_THEME="yuki"
ZSH_DISABLE_COMPFIX=true

plugins=(vi-mode git docker kubectl)

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
