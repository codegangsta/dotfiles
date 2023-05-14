map <Leader>a :call VimuxRunCommand("clear; bundle exec rspec --tty\n") <cr>
map <Leader>t :call VimuxRunCommand("clear; bundle exec rspec --tty ".expand("%")."\n") <cr>
map <Leader>l :call VimuxRunCommand("clear; bundle exec rspec --tty ".expand("%").":".line(".")."\n") <cr>
map <leader>b :!bundle<cr>
