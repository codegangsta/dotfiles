# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Exports
export ANDROID_NDK="$HOME/sdks/android-ndk-r8b"
export IOS_SDK=6.1

# Global aliases
#alias ctags="`brew --prefix`/bin/ctags"
alias -g gits='git status'
alias -g deploysdk='noglob rake build:ios["iPhone Developer: Jeremy Saenz (3SSR85QQK9)"] deploy:sdk'
alias -g tag='ctags -R .'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/jeremysaenz/sdks/apache-maven-3.0.4/bin:/usr/local/heroku/bin:/Users/jeremysaenz/.rvm/gems/ruby-1.9.3-p194/bin:/Users/jeremysaenz/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/jeremysaenz/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/jeremysaenz/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/jeremysaenz/sdks/android-ndk-r8b:/Users/jeremysaenz/sdks/android-sdk-macosx/tools:/Users/jeremysaenz/sdks/android-sdk-macosx/platform-tools:/Users/jeremysaenz/sdks/NaturalDocs-1.52
