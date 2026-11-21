# Fish shell configuration file
# https://github.com/skolobov/dotfiles

# Homebrew: Apple Silicon or Intel
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew
    if test -x $brew
        $brew shellenv fish | source
        break
    end
end

# User tools first; mise shims let non-interactive shells find mise tools
fish_add_path --global --move ~/.local/bin ~/.local/share/mise/shims
fish_add_path --global --append ~/.krew/bin

set -gx LANG en_US.UTF-8
set -gx LC_ALL $LANG

# Preferred editor
if type -q nvim
    set -gx EDITOR nvim
    alias vim nvim
else
    set -gx EDITOR vim
end
set -gx VISUAL $EDITOR

alias g git

status is-interactive; or exit

type -q fzf; and fzf --fish | source
type -q zoxide; and zoxide init fish | source
type -q starship; and starship init fish | source
type -q direnv; and direnv hook fish | source
type -q mise; and mise activate fish | source
