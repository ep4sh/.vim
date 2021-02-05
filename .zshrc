stty icrnl
alias kgpa='kubectl get pod --all-namespaces'
alias vi='vim'
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
alias bb='kubectl run busybox --image=ep4sh/debug --rm -it --restart=Never --command --'
alias bbaws='kubectl run busybox --image=ep4sh/debug:awscli --rm -it --restart=Never --command --'
alias bbq='kubectl run busybox --image=ep4sh/debug-sql --rm -it --restart=Never --command --'
alias bba='kubectl run busybox --image=ep4sh/debug:arm --rm -it --restart=Never --command --'
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
ZSH_THEME="fwalch"
ZSH_DISABLE_COMPFIX=true

plugins=(vi-mode git docker kubectl)

source $ZSH/oh-my-zsh.sh
source $HOME/.zprofile


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
