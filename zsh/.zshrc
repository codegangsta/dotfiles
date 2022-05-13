# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX=true

export JOURNAL=$HOME/notes/journal
export DOTFILES=$HOME/.dotfiles

# Global aliases
alias -g gits='git status'
alias -g be='bundle exec'
alias -g tks='tmux kill-session'
alias -g td='tmux detach'
alias -g ta='tmux attach'
alias -g vim="nvim"
alias -g vi="nvim"
alias -g dc="docker-compose"
alias -g tf="terraform"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins+=(git)

source $ZSH/oh-my-zsh.sh
# Disable auto correct
unsetopt correct_all

# Shell scripts
export PATH=$PATH:$HOME/.dotfiles/bin

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:$GOPATH/bin

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export DISABLE_AUTO_TITLE=true

# NPM path
export PATH="/usr/local/share/npm/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

# Status
status() {
        $*;
        if (( $? == 0 )); 
                then; tmux set-option -q status-bg green; 
                else; tmux set-option -q status-bg red; 
        fi
        tmux set-option -q status-right "$* ";
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export PATH="/Users/jeremy/go/bin:$PATH"

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH"
path+=("/Users/jeremy/.local/bin")
. "/Users/jeremy/.wasmedge/env"
