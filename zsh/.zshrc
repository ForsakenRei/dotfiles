# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
    source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
    source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -e ~/.local/bin/zoxide ]]; then
    eval "$(zoxide init zsh)"
fi

alias zshconfig="vi ~/.zshrc"
alias md="mkdir -p"
alias c="clear"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias sudo="sudo "
alias h="history"
alias j="jobs -l"
alias k="kill -9"
alias tm="tmux"
alias tma="tmux attach -d -t"
alias tms="tmux new -s"
alias tmk="tmux kill-set -t"
alias tml="tmux ls"
alias ss="ss -tulanp"
alias ps="ps aux"
alias ping="ping -c 5"
alias x="exit"
alias e="ehco"
alias jctl="journalctl -xeu"
alias sctl="systemctl"

if [[ -x "$(command -v exa)" ]]; then
    alias ll="exa --icons --git -lhg --group-directories-first"
    alias la="exa --icons --git -lahg --group-directories-first"
    alias ld="exa --icons --git -lahgD"
    alias lf="exa --icons --git -lahg | rg -v '^d'"
else
    alias ll="ls -lh --group-directories-first"
    alias la="ls -lah --group-directories-first"
    alias ld="ls -lahd */"
    alias lf="ls -lah | rg -v '^d'"
fi

if [[ -x "$(command -v nvim)" ]]; then
    alias vi="nvim"
else
    alias vi="vi"
fi

if [[ -x "$(command -v zoxide)" ]]; then
    alias cd="z"
else
    alias cd="cd"
fi

if [[ -x "$(command -v duf)" ]]; then
    alias df="duf"
else
    alias df="df -hT | { read -r line; echo "$line"; sort -k 7,7; }"
fi

if [[ -x "$(command -v rg)" ]]; then
    alias rg="rg -n"
else
    alias rg="grep -n --color=auto"
fi

if [[ -x "$(command -v bat)" ]]; then
    alias cat="bat --theme=TwoDark"
else
    alias cat="cat"
fi

if [[ -x "$(command -v btop)" ]]; then
    alias top="btop"
else
    alias top="top"
fi

# for sbc attached to 3d printer
# alias e3s1="sudo chmod 777 /dev/ttyUSB0" 

# if broot is installed
if [[ -e $HOME/.config/broot/launcher/bash/br ]]; then
    source $HOME/.config/broot/launcher/bash/br
fi

export EDITOR="/usr/local/bin/nvim"