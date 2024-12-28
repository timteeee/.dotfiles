# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybinds
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Completions
autoload -U compinit; compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf --preview 'ls --color $realpath'

# Variables
export PLUGINDIR=$HOME/.zsh/plugins
export DEV=$HOME/Developer
export CONFIG=$HOME/.config
export DOTFILES=$HOME/.dotfiles
export VOLTA_HOME="$HOME/.volta"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ls="ls --color"

# Plugins
source $PLUGINDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $PLUGINDIR/fzf-tab/fzf-tab.plugin.zsh
source $PLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Vim Mode settings
export ZVM_VI_HIGHLIGHT_FOREGROUND=default
export ZVM_VI_HIGHLIGHT_BACKGROUND="#373b41"

# FZF settings
zvm_after_init_commands+=('eval "$(fzf --zsh)"')

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
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

export FZF_COMPLETION_TRIGGER="**" # **<TAB> to trigger completions
export FZF_COMPLETION_OPTS="$FZF_DEFAULT_OPTS \
    --info=inline \
    --no-scrollbar \
"

export FZF_TMUX_OPTS="$FZF_DEFAULT_OPTS"

export FZF_CTRL_R_OPTS="
    --preview 'echo {}' --preview-window up:3:hidden:wrap
    --bind 'ctrl-/:toggle-preview'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --header 'Press CTRL-Y to copy command into clipboard'
    --no-scrollbar
"

# Zoxide settings
export _ZO_DATA_DIR="$HOME/.local/share"
export _ZO_RESOLVE_SYMLINKS=1
export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS"

eval "$(pyenv init --path)"

eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"
