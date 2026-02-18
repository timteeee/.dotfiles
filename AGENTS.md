- The repo root mirrors `$HOME`. Path in repo = path in home directory.
- The entire repo is a single stow package. Do not create nested packages.
- Never commit secrets.
- Modifying files tracked on `main` from the work branch is fine, but be careful to minimize the potential for rebase conflicts during sync.

## Upstream vs Local Changes

This repo has a fork-based workflow. `main` is shared config; local branches from `main` carry environment-specific additions. When making changes, consider whether they belong upstream (`main`) or only on a local branch.

If a requested change mixes both — e.g., a new tool that requires shared config changes plus work-specific setup — work with the user to split it cleanly. Propose which parts target `main` and which stay local. When possible, structure shared config to source optional local overrides so the work branch delta stays minimal.
