# ── History ──────────────────────────────────────────────────────────
# Shared across sessions, deduped, and large enough to make fzf
# history search (Ctrl+R) useful over long periods.
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ── Completions ──────────────────────────────────────────────────────
# compinit scans every directory in fpath for completion files on each
# shell launch, which is expensive. The scan results are cached in
# ~/.zcompdump. This check compares the current day (Julian) against
# the dump file's last-modified day — if they match, we skip the full
# scan and load the cached dump directly with -C. The dump is
# regenerated at most once per day, or when you delete ~/.zcompdump.
autoload -U compinit
zmodload zsh/stat
if [[ -f ~/.zcompdump && $(date +'%j') == $(zstat +mtime -F '%j' ~/.zcompdump) ]]; then
    compinit -C
else
    compinit
fi

# Case-insensitive matching, colored results, and fzf-tab preview.
# zstyle declarations take effect whenever the completion system or 
# fzf-tab reads them, so order doesn't matter.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf --preview 'ls --color $realpath'

# ── Aliases ──────────────────────────────────────────────────────────
alias ls="ls --color"

# ── ZVM (Zsh Vi Mode) ───────────────────────────────────────────────-
# All ZVM config and hooks must be defined BEFORE sourcing the plugin.
#
# ZVM_INIT_MODE=sourcing makes ZVM initialize synchronously during
# `source`, not lazily on first keystroke. This ensures zvm_after_init
# fires immediately, which is critical for keybinds surviving
# `source ~/.zshrc` during development.
export ZVM_VI_HIGHLIGHT_FOREGROUND=default
export ZVM_VI_HIGHLIGHT_BACKGROUND="#373b41"
export ZVM_INIT_MODE=sourcing

# ZVM clobbers all keybinds on init, so anything that needs to survive
# (fzf shell integration, custom keybinds) must be re-applied here.
function zvm_after_init() {
    eval "$(fzf --zsh)"
    bindkey "^p" history-search-backward
    bindkey "^n" history-search-forward
}

# ── Plugins ──────────────────────────────────────────────────────────
# Order matters:
#   1. zsh-vi-mode first (takes over keymap; zvm_after_init fires here)
#   2. fzf-tab (overrides default completion menu with fzf)
#   3. zsh-syntax-highlighting (must come before autosuggestions so
#      suggestions don't get syntax-highlighted incorrectly)
#   4. zsh-autosuggestions last
PLUGINDIR="$HOME/.zsh/plugins"
source "$PLUGINDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
source "$PLUGINDIR/fzf-tab/fzf-tab.plugin.zsh"
source "$PLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$PLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ── FZF Settings ─────────────────────────────────────────────────────
export FZF_DEFAULT_OPTS=" \
    --highlight-line \
    --info=inline-right \
    --ansi \
    --no-scrollbar \
    --layout=reverse \
    --color=bg+:#373b41 \
    --color=bg:#1d1f21 \
    --color=border:#969896 \
    --color=fg:#c5c8c6 \
    --color=fg+:#c5c8c6:bold \
    --color=gutter:#1d1f21 \
    --color=header:#4d5057 \
    --color=hl+:#de935f \
    --color=hl:#de935f \
    --color=info:#4d5057 \
    --color=marker:#de935f\
    --color=pointer:#de935f \
    --color=prompt:#81a2be \
    --color=query:#c5c8c6:regular \
    --color=separator:#969896 \
    --color=spinner:#b294bb \
"

export FZF_CTRL_R_OPTS="
    --preview 'echo {}' --preview-window up:3:hidden:wrap
    --bind 'ctrl-/:toggle-preview'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --header 'Press CTRL-Y to copy command into clipboard'
    --no-scrollbar
"

# ── Zoxide Settings ─────────────────────────────────────────────────
# Must be set before `zoxide init` below.
# Inherits FZF_DEFAULT_OPTS so zoxide's interactive selection matches
# the rest of the fzf theme.
export _ZO_DATA_DIR="$HOME/.local/share"
export _ZO_RESOLVE_SYMLINKS=1
export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS"

# ── Tool Initialization ─────────────────────────────────────────────
# fnm: per-shell Node version management. Uses a unique multishell
# path per session, so this MUST run in every shell (not .zprofile).
eval "$(fnm env --use-on-cd)"

eval "$(zoxide init zsh --cmd cd)"

# Starship prompt — must be last so it can wrap any existing hooks.
eval "$(starship init zsh)"
