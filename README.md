# dotfiles

Stow-managed dotfiles. The repo root mirrors `$HOME` — a single stow package links config into place.

## Prerequisites

- stow
- just
- uv

## Install

```shell
git clone git@<fork-url>.git ~/.dotfiles
cd ~/.dotfiles
just link          # create symlinks in $HOME (preview first: just preview-link)
```

`just link` symlinks `~/.config/*` as whole directories where the target doesn't exist, so anything written into e.g. `~/.config/*` lands in the repo and is trackable by git, unless gitignored.

On a machine with existing config, `just adopt` pulls current `$HOME` files into the repo — review the diff before committing.

## Daily workflow

1. Edit config (in the repo, or via the `~/.config` symlinks).
2. `just validate` — checks the opencode config against its schema, shell syntax, and stow consistency.
3. Commit, push, open a PR.

## Fork pattern

`ttdotsh/.dotfiles` is the canonical repo. This machine uses it directly (`origin` only).

The work machine keeps a fork with `upstream` → `ttdotsh/.dotfiles`. To pull changes from here:

```shell
just sync <branch>   # fetches upstream, fast-forwards main, rebases <branch>
```

`sync` is guarded and refuses to run without an `upstream` remote. Feature branches are PR candidates against `main`; `local/*` branches are machine-specific and never PR'd.
