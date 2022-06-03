eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx GOPATH $HOME/go
set -gx GOROOT /opt/homebrew/opt/go/libexec
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx DOTFILES $HOME/.dotfiles

fish_add_path $HOME/.dotfiles/bin
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin
fish_add_path $GOROOT/bin
fish_add_path /usr/local/bin

if status is-interactive
    starship init fish | source
end

function fish_greeting
    # Do nothing
end
