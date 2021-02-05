# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ep4sh/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ep4sh/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ep4sh/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ep4sh/.fzf/shell/key-bindings.zsh"
