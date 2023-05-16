# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shigure/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/shigure/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/shigure/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/shigure/.fzf/shell/key-bindings.zsh"
