home := env("HOME")

[default]
help:
    @just --list --unsorted

# Link dotfiles to home
link:
    stow -t {{ home }} .

# Preview what link would do
preview-link:
    stow -t {{ home }} --no --verbose .

# Unlink dotfiles from home
unlink:
    stow -t {{ home }} -D .

# Restow (cleans stale symlinks)
relink:
    stow -t {{ home }} -R .

# Adopt existing files into repo
adopt:
    stow -t {{ home }} --adopt .

# Validate opencode config against its published schema
validate-opencode:
    sed '/^[[:space:]]*\/\//d' .config/opencode/opencode.jsonc | uvx check-jsonschema --schemafile https://opencode.ai/config.json -

# Check shell syntax
validate-shell:
    #!/usr/bin/env bash

    set -euo pipefail

    for f in .zshrc .zprofile .zshenv; do
        zsh -n "$f"
    done

# Dry-run stow against a clean target
validate-stow:
    stow -t "$(mktemp -d)" --no --verbose .

# Run all validation checks
validate: validate-opencode validate-shell validate-stow
    @echo "✓ validate passed"

# Sync fork with upstream and rebase local branch
sync branch:
    #!/usr/bin/env bash

    set -euo pipefail

    if ! git remote get-url upstream >/dev/null 2>&1; then
        echo "sync is for forks with an upstream remote configured to https://github.com/timteeee/.dotfiles." >&2
        echo "On a machine that only uses origin, pull from origin instead:" >&2
        echo "  git pull --ff-only origin main" >&2
        exit 1
    fi

    current=$(git branch --show-current)

    git fetch upstream
    git checkout main
    git merge --ff-only upstream/main
    git push origin main

    if git show-ref --verify --quiet refs/heads/{{ branch }}; then
        git checkout {{ branch }}
        git rebase main
        git push --force-with-lease origin {{ branch }}
    fi

    git checkout "$current"
    echo "✓ Synced"

# Preview upstream changes before syncing
preview-sync:
    #!/usr/bin/env bash

    set -euo pipefail

    if ! git remote get-url upstream >/dev/null 2>&1; then
        echo "preview-sync is for forks with an upstream remote configured to https://github.com/timteeee/.dotfiles." >&2
        echo "On a machine that only uses origin, fetch origin instead:" >&2
        echo "  git fetch origin && git log --oneline main..origin/main" >&2
        exit 1
    fi

    git fetch upstream
    git log --oneline main..upstream/main
