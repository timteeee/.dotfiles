dotfiles := file_name(justfile_directory())
home := env("HOME")

[default]
help:
    @just --list --unsorted

# Link dotfiles to home
link:
    stow -d {{ home }} -t {{ home }} {{ dotfiles }}

# Preview what link would do
preview-link:
    stow -d {{ home }} -t {{ home }} --no --verbose {{ dotfiles }}

# Unlink dotfiles from home
unlink:
    stow -d {{ home }} -t {{ home }} -D {{ dotfiles }}

# Restow (cleans stale symlinks)
relink:
    stow -d {{ home }} -t {{ home }} -R {{ dotfiles }}

# Adopt existing files into repo
adopt:
    stow -d {{ home }} -t {{ home }} --adopt {{ dotfiles }}
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
sync-preview:
    #!/usr/bin/env bash

    set -euo pipefail

    git fetch upstream
    git log --oneline main..upstream/main
