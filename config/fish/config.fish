switch (uname)
    case Linux
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        set -gx GOROOT /home/linuxbrew/.linuxbrew/opt/go/libexec
        fish_add_path ~/.local/kitty.app/bin
        fish_add_path ~/.local/bin
    case Darwin
        eval "$(/opt/homebrew/bin/brew shellenv)"
        set -gx GOROOT /opt/homebrew/opt/go/libexec
end

bind "[101;9u" edit_command_buffer

op completion fish | source

set -gx GOPATH $HOME/go
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx DOTFILES $HOME/.dotfiles
set -gx KO_DOCKER_REPO ghcr.io/codegangsta
set -gx TF_VAR_do_token op://codegangsta/do_terraform_token/password

set -gx SCP_US_WEST nats://127.0.0.1:14222,nats://127.0.0.1:14223,nats://127.0.0.1:14224,nats://127.0.0.1:14225,nats://127.0.0.1:14226
set -gx SCP_US_CENTRAL nats://127.0.0.1:15222,nats://127.0.0.1:15223,nats://127.0.0.1:15224
set -gx SCP_US_EAST nats://127.0.0.1:16222,nats://127.0.0.1:16223,nats://127.0.0.1:16224
set -gx SCP_US_APAC nats://127.0.0.1:17222,nats://127.0.0.1:17223,nats://127.0.0.1:17224
set -gx SCP_US_EU_CENTRAL nats://127.0.0.1:18222,nats://127.0.0.1:18223,nats://127.0.0.1:18224

fish_add_path $HOME/.dotfiles/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $GOPATH/bin
fish_add_path $GOROOT/bin
fish_add_path /usr/local/bin


if status is-interactive
    starship init fish | source
end

function fish_greeting
    # Do nothing
end
