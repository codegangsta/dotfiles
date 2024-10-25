function vim --wraps=nvim --description 'alias vim=nvim'
    nvm use 18 && nvim $argv
end
