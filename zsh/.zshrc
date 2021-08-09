# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX=true

JOURNAL=$HOME/notes/journal

#rbenv
eval "$(rbenv init -)"

# gh
eval "$(hub alias -s)"

# Global aliases
alias -g gits='git status'
alias -g be='bundle exec'
alias -g github='git hub'
alias -g tks='tmux kill-session'
alias -g rmswp='find . -name ".*.sw*" | xargs rm -f'
alias -g s3='s3cmd'
alias -g journal='vim -f "$JOURNAL/$(date +%F).md" && git -C $JOURNAL add . && git -C $JOURNAL c && echo "pb" | xargs -p git -C $JOURNAL'
alias -g vim="nvim"
alias -g vi="nvim"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Disable auto correct
unsetopt correct_all

export GOPATH=$HOME/code/gocode
export PATH=$PATH:$GOPATH/bin

export GOCODE=$GOPATH/src/github.com/codegangsta

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export DISABLE_AUTO_TITLE=true

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# NPM path
export PATH="/usr/local/share/npm/bin:$PATH"

# Status
status() {
        $*;
        if (( $? == 0 )); 
                then; tmux set-option -q status-bg green; 
                else; tmux set-option -q status-bg red; 
        fi
        tmux set-option -q status-right "$* ";
}
eval "$(rbenv init - --no-rehash)"
export PATH="$HOME/.rbenv/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
