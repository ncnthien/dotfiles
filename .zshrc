if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZLE_RPROMPT_INDENT=0

export ZSH="$HOME/.oh-my-zsh"
export PATH=~/bin:"$PATH"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-nvm
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias v="nvim"
alias l="lsd -lha"
alias ls="lsd"
alias dot="cd ~/dotfiles"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
