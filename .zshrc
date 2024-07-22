export ZSH="$HOME/.oh-my-zsh"
export PATH=~/bin:"$PATH"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias v="nvim"
alias l="lsd -lha"
alias ls="lsd"
alias dot="cd ~/dotfiles"
