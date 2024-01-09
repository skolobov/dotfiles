# Setup fzf
# ---------
HOMEBREW=$(brew --prefix)
if [[ ! "$PATH" == *${HOMEBREW}/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOMEBREW}/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "${HOMEBREW}/opt/fzf/shell/completion.bash"

# Key bindings
# ------------
source "${HOMEBREW}/opt/fzf/shell/key-bindings.bash"
