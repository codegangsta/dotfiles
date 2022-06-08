function session -a session --description "Fire up a session of a project in a new kitty tab"
  set session $argv[1]
  set window_id (kitty @ launch --type=tab --tab-title $session --copy-env --cwd code/$session)
  kitty @ send-text -m "id:$window_id" "vim .\n"
end

function s --wrap session --description 'alias vim=nvim'
  session $argv
end
