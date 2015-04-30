# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# default ruby
chruby 2.0

# Z
source "$HOME/.dotfiles/z/z.sh"

# gh
eval "$(hub alias -s)"

# Global aliases
alias ctags="`brew --prefix`/bin/ctags"
alias -g gits='git status'
alias -g be='bundle exec'
alias -g github='git hub'
alias -g mux='tmuxinator'
alias -g tks='tmux kill-session'
alias -g rmswp='find . -name ".*.sw*" | xargs rm -f'
alias -g s3='s3cmd'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Disable auto correct
unsetopt correct_all

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export GOPATH=$HOME/code/gocode
export PATH=$PATH:$GOPATH/bin

export GOCODE=$GOPATH/src/github.com/codegangsta

export EDITOR='vim'
export DISABLE_AUTO_TITLE=true

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# NPM path
export PATH="/usr/local/share/npm/bin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Calibre
export PATH="/Applications/calibre.app/Contents/MacOS/:$PATH"

# SlimerJS
export SLIMERJSLAUNCHER="/Applications/Firefox.app/Contents/MacOS/firefox"

# Pomodoro baby
pom() { pompom -e "$*" && pompom -d 5 "Break Time" }

# Status
status() {
        $*;
        if (( $? == 0 )); 
                then; tmux set-option -q status-bg green; 
                else; tmux set-option -q status-bg red; 
        fi
        tmux set-option -q status-right "$* ";
}
