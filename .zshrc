stty icrnl
alias python='python3'
alias t='terraform'
alias g='googler'
alias c='clear'
alias g='git'
alias k='kubectl'
alias mk='minikube'
alias kindnew='kind delete cluster && kind create cluster'
alias drc='docker rm $(docker  ps -a -q)'
alias dri='docker rmi $(docker  images)'
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/.rvm/bin"
export ZSH="$HOME/.oh-my-zsh"
export TERM=linux
export AWS_REGION=us-east-1

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
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
