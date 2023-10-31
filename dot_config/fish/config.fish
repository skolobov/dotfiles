# Fish shell configuration file
# https://github.com/skolobov/dotfiles
# vim: ts=2 ft=fish

# Use English (United States) locale
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

# Use Neovim as default editor
set -x EDITOR (which nvim)
set -x VISUAL $EDITOR
function vim; nvim $argv; end

# Prompt theme configuration
set -g default_user skolobov

# g is short for git (or hub)
function g; git $argv; end

# Proceed only if running an interactive shell
status --is-interactive; or exit

# Initialize rtx if present
if which -s rtx
  rtx activate fish | source
end

