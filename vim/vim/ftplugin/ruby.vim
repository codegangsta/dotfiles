map <Leader>a :call VimuxRunCommand("clear; be rspec --tty\n") <cr>
map <Leader>t :call VimuxRunCommand("clear; be rspec --tty ".expand("%")."\n") <cr>
map <Leader>l :call VimuxRunCommand("clear; be rspec --tty ".expand("%").":".line(".")."\n") <cr>
map <leader>r :!ruby %<cr>
map <leader>b :!bundle<cr>

setlocal shiftwidth=2
setlocal tabstop=2
