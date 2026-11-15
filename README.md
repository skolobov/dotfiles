# Sergei Kolobov's dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io).

## What's inside

- Zsh with [Oh My Zsh](https://ohmyz.sh) and [Starship](https://starship.rs), plus a Fish config
- [Neovim](https://neovim.io) with [LazyVim](https://www.lazyvim.org)
- Git with [delta](https://github.com/dandavison/delta) and per-directory work identities
- Ghostty, Herdr, tmux, bat, fzf and other CLI tooling
- Homebrew packages split by machine profile

## Machine profiles

`chezmoi init` asks three questions and stores the answers only in the
local `~/.config/chezmoi/chezmoi.yaml`, never in this repo:

- **Profile:** `personal` for my own Mac, `work` for a work-issued Mac.
  Personal apps and App Store installs only land on `personal`.
- **Default Git email** for the machine.
- **Work contexts:** `name|~/Code/Dir|email` entries separated by `;`.
  Each one gets a Git `includeIf` so commits under that directory use the
  matching email. Leave blank on a work Mac where the default email is
  already the work one.

Work-specific Homebrew packages go in `~/.config/chezmoi/Brewfile.local`,
which is also never committed.

## New Mac

Install the Xcode Command Line Tools, then let chezmoi do the rest:

```shell
xcode-select --install
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${TMPDIR}" init --apply skolobov
```

This clones the repo over HTTPS, installs Homebrew, applies the dotfiles
and runs `brew bundle`. To push changes later, switch the remote to SSH once
your keys are set up:

```shell
chezmoi git -- remote set-url origin git@github.com:skolobov/dotfiles.git
```

## Day to day

```shell
chezmoi diff                        # preview changes
chezmoi apply                       # apply them
chezmoi re-add                      # pull local edits back into the repo
chezmoi update                      # pull from GitHub and apply
chezmoi apply --refresh-externals   # update Oh My Zsh and plugins now
chezmoi edit-config                 # change profile or work contexts
```

## Keeping the repo clean

This repo is public. A pre-commit hook in `.githooks` runs
[gitleaks](https://github.com/gitleaks/gitleaks) and blocks any staged change
that mentions a local work context name, email domain or directory.
chezmoi enables it on each machine.

## License

[BSD 3-Clause](LICENSE).
