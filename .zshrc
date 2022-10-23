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
plugins=(fzf-tab git colorize npm pip python debian zsh-z zsh-syntax-highlighting zsh-autosuggestions fzf k )

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
alias connectGithubCodespace='ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null vscode@localhost'
alias portsForwardCodespace='gh codespace ports forward 80:80 2222:2222 3003:3003 3033:3033 3034:3034 3035:3035 3306:3306 8025:8025 9092:9092 9293:9293 15000:15000 15001:15001 15306:15306 18081:18081 8091:8091 9002:9002 28081:28081 9200:9200 40427:40427 45621:45621 35317:35317 45939:45939 43577:43577 33207:33207 38081:38081'
alias killPort='kill -9 $(lsof -t -i:$1)'
alias prodShell='ssh -A -J bastion.githubapp.com shell.service.ac4-iad.github.net'
alias openimg="eog"
alias rt='bin/rails test'
alias rc='bin/rails c'
alias e='nvim'
alias rgrb='rg -g "*.rb"'
alias rgts='rg -g "*.ts"'

# required for gh codespace bin generate service files
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

git config --global core.editor "vim"
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
EDITOR="nvim"

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

PATH=/Users/ax/Library/Python/3.8/bin:/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# 
if [[ -r "$HOME/.rvm/scripts/rvm" ]]; then
  source $HOME/.rvm/scripts/rvm
fi
