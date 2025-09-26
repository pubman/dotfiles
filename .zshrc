#!/usr/bin/env zsh

# =========================================
# Modern Zsh Configuration with Starship
# =========================================

# =========================================
# Bash Compatibility Shims
# =========================================

# Define bash-specific functions as no-ops for zsh compatibility
complete() { : ; }  # Bash completion function - ignore in zsh
compgen() { : ; }   # Bash completion generator - ignore in zsh

# Export these functions so subprocesses don't error
# Note: export -f doesn't work the same in zsh, so we skip this
# export -f complete compgen 2>/dev/null || true

# Add essential paths to `$PATH`
export PATH="/opt/homebrew/bin:$HOME/bin:$PATH"

# =========================================
# Safe Loading of Dotfiles
# =========================================

# Create a function to safely source files, skipping bash-specific ones
safe_source() {
    local file="$1"
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # Skip files with bash-specific content
        if ! grep -q "complete\s*-" "$file" 2>/dev/null; then
            source "$file"
        fi
    fi
}

# Load the shell dotfiles, preserving your existing configuration:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
    safe_source "$file"
done
unset file

# =========================================
# Zsh-specific Configuration (replaces bash shopt)
# =========================================

# Case-insensitive globbing (replaces shopt -s nocaseglob)
setopt NO_CASE_GLOB

# Append to history instead of overwriting (replaces shopt -s histappend)
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Autocorrect typos in path names when using `cd` (replaces shopt -s cdspell)
setopt CORRECT

# Enable advanced globbing features (replaces shopt -s globstar)
setopt EXTENDED_GLOB

# Auto-cd into directories without typing 'cd' (replaces shopt -s autocd)
setopt AUTO_CD

# Better history configuration
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# =========================================
# Modern Zsh Plugins
# =========================================

# Load zsh-completions (must be before compinit)
if [[ -d ~/.zsh/zsh-completions ]]; then
    fpath=(~/.zsh/zsh-completions/src $fpath)
fi

# Initialize completion system
autoload -U compinit && compinit

# Load zsh-autosuggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Configure autosuggestions
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# Load zsh-syntax-highlighting (must be at the end)
if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# =========================================
# Enhanced Tab Completion (zsh equivalents of bash completions)
# =========================================

# Enable tab completion for Homebrew commands
if command -v brew &> /dev/null; then
    fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if command -v git &> /dev/null; then
    compdef g=git
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config
if [[ -e "$HOME/.ssh/config" ]]; then
    h=()
    if [[ -r ~/.ssh/config ]]; then
        h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
    fi
    zstyle ':completion:*:ssh:*' hosts $h
    zstyle ':completion:*:scp:*' hosts $h
    zstyle ':completion:*:sftp:*' hosts $h
fi

# Configure completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# =========================================
# Starship Prompt
# =========================================

# Set Starship config path to dotfiles directory
export STARSHIP_CONFIG="$HOME/dotfiles/starship.toml"

# Initialize starship (replaces your custom bash prompt)
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# =========================================
# Additional Modern Tools Integration
# =========================================

# Initialize zoxide if available (modern replacement for z/autojump)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# =========================================
# External Tool Integration (Zsh-safe)
# =========================================

# Initialize rbenv with zsh support
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - zsh)"
fi

# Initialize nvm if available
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
fi

# Google Cloud SDK - zsh compatible
if [[ -f '/Users/euanhay/Downloads/google-cloud-sdk/path.zsh.inc' ]]; then
    source '/Users/euanhay/Downloads/google-cloud-sdk/path.zsh.inc'
fi

if [[ -f '/Users/euanhay/Downloads/google-cloud-sdk/completion.zsh.inc' ]]; then
    source '/Users/euanhay/Downloads/google-cloud-sdk/completion.zsh.inc'
elif [[ -f '/Users/euanhay/Downloads/google-cloud-sdk/completion.bash.inc' ]]; then
    # Skip bash completion - we have our own zsh completion system
    : # no-op
fi

# Bun completions (zsh native)
if [[ -s "$HOME/.bun/_bun" ]]; then
    source "$HOME/.bun/_bun"
fi

# Angular CLI autocompletion (if available)
if command -v ng &> /dev/null; then
    eval "$(ng completion script)"
fi

# =========================================
# Preserve existing environment setup
# =========================================

# Your existing .exports file handles:
# - EDITOR='nvim'
# - NODE_REPL_HISTORY settings
# - PYTHONIOENCODING
# - HISTSIZE and HISTFILESIZE
# - LANG and LC_ALL
# - GPG_TTY
# - And other environment variables

# Your existing .aliases file provides all your shortcuts
# Your existing .functions file provides all your custom functions