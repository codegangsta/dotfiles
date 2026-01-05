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
export EDITOR=zed
export GIT_EDITOR="zed --wait --new"
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
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Aliases
alias c=claude
alias lg="lazygit"
alias gits="git status"
alias vim="nvim"
alias dc="docker-compose"
alias tf="terraform"

# Starship prompt - consider async loading or simpler prompt
eval "$(starship init zsh)"

# FZF configuration
eval "$(fzf --zsh)"

# Fish-like autosuggestions - lazy load
__load_autosuggestions() {
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    unset -f __load_autosuggestions
}
# Load after small delay to not block initial prompt
(sleep 0.1 && __load_autosuggestions) &!

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
source /opt/homebrew/opt/asdf/libexec/asdf.sh
