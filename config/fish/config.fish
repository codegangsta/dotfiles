starship init fish | source

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
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    # Do nothing
end
