# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

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

setopt autocd notify

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

# zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use neovim as default editor
[ -e /usr/bin/nvim ] && export EDITOR="/usr/bin/nvim" && export VISUAL="/usr/bin/nvim"
[ -e /usr/local/bin/nvim ] && export EDITOR="/usr/local/bin/nvim" && export VISUAL="/usr/local/bin/nvim"

[ -e /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -e ~/.pyenv ] && command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
[ -e ~/.pyenv ] && eval "$(pyenv init -)"

# zoxide
export PATH="$HOME/.local/bin:$PATH"
[ -e /usr/bin/zoxide ] || [ -e ~/.local/bin/zoxide ] && eval "$(zoxide init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# broot
[ -e $HOME/.config/broot/launcher/bash/br ] && source $HOME/.config/broot/launcher/bash/br

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias
alias zshconfig="vi ~/.zshrc"
alias zshreload="source ~/.zshrc"
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
alias tmk="tmux kill-ses -t"
alias tml="tmux ls"
alias ss="ss -tulanp"
alias ps="ps aux"
alias ping="ping -c 5"
alias x="exit"
alias e="ehco"
alias jctl="journalctl -xeu"
alias sctl="systemctl"

# conditional alias
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

if [[ -x "$(command -v btop)" ]]; then
    alias top="btop"
else
    alias top="top"
fi

if [[ -x "$(command -v gdu)" ]]; then
    alias du="gdu"
else
    alias du="du -hd 1 | sort -rh"
fi

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# for sbc attached to 3d printer
# alias e3s1="sudo chmod 777 /dev/ttyUSB0" 
