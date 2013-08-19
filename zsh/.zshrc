# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[[ $TERM = "screen" ]] && rvm use default

# Global aliases
alias ctags="`brew --prefix`/bin/ctags"
alias -g gits='git status'
alias -g tag='ctags -R .'
alias -g mux='tmuxinator'
alias -g tks='tmux kill-session'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Disable auto correct
unsetopt correct

# Teamocil auto completion
compctl -g '~/.teamocil/*(:t:r)' teamocil

export GOPATH=$HOME/code/gocode
export GOCODE=$GOPATH/src/github.com/codegangsta
export PATH=$PATH:$GOPATH/bin

export EDITOR='vim'
export DISABLE_AUTO_TITLE=true

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
