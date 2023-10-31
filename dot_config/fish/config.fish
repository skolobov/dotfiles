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

# Starship - cross-shell prompt (https://starship.rs)
which -s starship && starship init fish | source

# direnv – unclutter your .profile (https://direnv.net)
which -s direnv && direnv hook fish | source

# rtx - polyglot runtime manager (https://github.com/jdx/rtx)
which -s rtx && rtx activate fish | source

