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

# NVM setup - FULLY LAZY LOAD (biggest optimization)
export NVM_DIR="$HOME/.nvm"

# Add node to path if default version exists (without loading NVM)
if [ -s "$NVM_DIR/alias/default" ]; then
    DEFAULT_NODE_VER=$(cat "$NVM_DIR/alias/default")
    export PATH="$NVM_DIR/versions/node/v${DEFAULT_NODE_VER#v}/bin:$PATH"
fi

# Lazy load NVM completely - only when actually needed
nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

# Create lazy loaders for node/npm/npx that will trigger NVM load if needed
node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npx "$@"
}

# Starship prompt - consider async loading or simpler prompt
eval "$(starship init zsh)"

# FZF configuration - lazy load on first use
__fzf_init() {
    eval "$(fzf --zsh)"
    unset -f __fzf_init
}
# Hook FZF to load on first Ctrl-R or Ctrl-T
bindkey -r '^R'
bindkey -r '^T'
bindkey -s '^R' $'\e[1~__fzf_init\n^R'
bindkey -s '^T' $'\e[1~__fzf_init\n^T'

# Fish-like autosuggestions - lazy load
__load_autosuggestions() {
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    unset -f __load_autosuggestions
}
# Load after small delay to not block initial prompt
(sleep 0.1 && __load_autosuggestions) &!

# Disable greeting (zsh doesn't have one by default, so this is just for completeness)

alias claude="/Users/codegangsta/.claude/local/claude"