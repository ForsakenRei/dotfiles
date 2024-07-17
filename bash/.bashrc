alias config="nvim ~/.zshrc"
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
alias x="exit"
alias e="ehco"
alias jctl="journalctl -xeu"
alias sctl="systemctl"

if [[ -x "$(command -v eza)" ]]; then
    alias ll="eza --icons --git -lhg --group-directories-first"
    alias la="eza --icons --git -lahg --group-directories-first"
    alias ld="eza --icons --git -lahgD"
    alias lf="eza --icons --git -lahg | rg -v '^d'"
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
