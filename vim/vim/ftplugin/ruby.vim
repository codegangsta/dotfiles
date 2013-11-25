map <Leader>a :call Send_to_Tmux("clear; bundle exec rspec\n") <cr>
map <Leader>t :call Send_to_Tmux("clear; bundle exec rspec ".expand("%")."\n") <cr>
map <leader>r :!ruby %<cr>
map <leader>b :!bundle<cr>

setlocal shiftwidth=2
setlocal tabstop=2
