# OS-specific configuration - optimized
if [[ "$(uname)" == "Darwin" ]]; then
    # Inline brew shellenv for macOS to avoid subprocess  
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export GOROOT=/opt/homebrew/opt/go/libexec
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
elif [[ "$(uname)" == "Linux" ]]; then
    # Inline brew shellenv for Linux to avoid subprocess
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
    export GOROOT=/home/linuxbrew/.linuxbrew/opt/go/libexec
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
    export PATH="$HOME/.local/kitty.app/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"
fi


# Environment variables
export GOPATH=$HOME/go
export EDITOR=cursor
export GIT_EDITOR="cursor -w"
export DOTFILES=$HOME/.dotfiles
export TF_VAR_do_token=op://codegangsta/do_terraform_token/password
export BUILDX_BAKE_ENTITLEMENTS_FS=0

# Path configuration
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# DENO_INSTALL path (if set)
if [ -n "$DENO_INSTALL" ]; then
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

# pnpm
export PNPM_HOME="/Users/jeremysaenz/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Aliases
alias c=claude
alias lg="lazygit"
alias gits="git status"
alias vim="nvim"
alias dc="docker-compose"
alias tf="terraform"

# NVM setup - lazy load for better performance
export NVM_DIR="$HOME/.nvm"
# Lazy load NVM to improve shell startup time
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

# Add node to path if default version exists
if [ -s "$NVM_DIR/alias/default" ]; then
    DEFAULT_NODE_VER=$(cat "$NVM_DIR/alias/default")
    export PATH="$NVM_DIR/versions/node/v${DEFAULT_NODE_VER}/bin:$PATH"
fi

# Auto-load default node version
if [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh" --no-use  # Load nvm but don't use a version yet
    nvm use default --silent 2>/dev/null || true  # Use default version silently
fi

# Starship prompt
eval "$(starship init zsh)"

# FZF configuration
eval "$(fzf --zsh)"

# Fish-like autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disable greeting (zsh doesn't have one by default, so this is just for completeness)

alias claude="/Users/codegangsta/.claude/local/claude"
