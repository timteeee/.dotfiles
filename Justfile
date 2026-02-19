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
    @echo "⚠ Review changes: just diff"

# Show uncommitted changes
diff:
    @git diff

# Sync fork with upstream and rebase local branch
sync branch:
    #!/usr/bin/env bash

    set -euo pipefail
	
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

    git fetch upstream
    git log --oneline main..upstream/main
