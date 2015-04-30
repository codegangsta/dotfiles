map <Leader>a :call VimuxRunCommand("clear; traffic be rspec --tty\n") <cr>
map <Leader>t :call VimuxRunCommand("clear; traffic be rspec --tty ".expand("%")."\n") <cr>
map <leader>r :!ruby %<cr>
map <leader>b :!bundle<cr>

setlocal shiftwidth=2
setlocal tabstop=2
