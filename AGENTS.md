Stow-managed dotfiles shared across machines via forks.

## Terminology

- **Canonical** — the shared config repo: `timteeee/.dotfiles`.
- **Fork** — a per-machine copy of canonical; `upstream` points at canonical.

## Layout

- Repo root mirrors `$HOME`; path in repo = path in home.
- Single stow package. No nested packages.
- `just link` symlinks package dirs into `$HOME` as whole directories (e.g. `~/.config/*`); anything written into them — by tools or agents — is part of the repo and trackable by git, except gitignored runtime files.
- Use `Justfile` recipes for repo operations; suggest a new recipe if one is missing.

## Fork workflow

- `just sync <branch>` syncs a fork's `main` against canonical, and then rebases `<branch>` from `main`; it fails unless an `upstream` remote is configured.

## Rules

- Never commit secrets.
- Run `just validate` before committing; fix failures first.
