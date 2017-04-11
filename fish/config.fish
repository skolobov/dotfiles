# Fish shell configuration file

# OMF theme configuration
set -g default_user skolobov

# Aliases
alias git=hub
alias g=git
alias gs='git status --short'
alias gd='git diff'
alias vim=nvim

# Initialize rbenv if present
status --is-interactive
  and test -n (which rbenv)
  and source (rbenv init - | psub)

# Initialize pyenv if present
status --is-interactive
  and test -n (which pyenv)
  and source (pyenv init - | psub)
  and source (pyenv virtualenv-init - | psub)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Locale configuration
# Prefer English for language and messages
set -gx LANG "en_US.UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
# Russian for everything else
set -gx LC_CTYPE "ru_RU.UTF-8"
set -gx LC_COLLATE "ru_RU.UTF-8"
set -gx LC_MONETARY "ru_RU.UTF-8"
set -gx LC_NUMERIC "ru_RU.UTF-8"
set -gx LC_TIME "ru_RU.UTF-8"
