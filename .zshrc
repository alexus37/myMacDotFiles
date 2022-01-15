# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=powerlevel10k/powerlevel10k
export FZF_BASE=$HOME/.fzf
plugins=(git colorize npm pip python debian zsh-z zsh-syntax-highlighting zsh-autosuggestions fzf k)

source $ZSH/oh-my-zsh.sh

# AX conf
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory
alias x='exit'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias openpdf='xdg-open'
alias connectGithubCodespace='ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null root@localhost
'
alias openimg="eog"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

if [[ "$(command -v thefuck)" ]]; then
  eval $(thefuck --alias)
fi



[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export CC=gcc
export CXX=g++

HOSTNAME="$(hostname)"  # Conda clobbers HOST, so we save the real hostname into another variable.

precmd() {
    OLDHOST="${HOST}"
    HOST="${HOSTNAME}"
}

preexec() {
    HOST="${OLDHOST}"
}


mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH
