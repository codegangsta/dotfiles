function tks --wraps='tmux kill-session' --description 'alias tks=tmux kill-session'
  tmux kill-session $argv; 
end
