# Fish shell configuration file
# https://github.com/skolobov/dotfiles

# Use English (United States) locale
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

# Prompt theme configuration
set -g default_user skolobov

# Useful aliases
alias git=hub
alias g=git
alias gs='git status --short'
alias gd='git diff'
alias vim=nvim

# Proceed only if running an interactive shell
status --is-interactive; or exit

# Initialize rbenv if present
if which -s rbenv
	source (rbenv init - | psub)
end

# Initialize pyenv if present
if which -s pyenv
	source (pyenv init - | psub)
	source (pyenv virtualenv-init - | psub)
	set -x VIRTUAL_ENV_DISABLE_PROMPT 1
end

# vim: ts=2 ft=fish
