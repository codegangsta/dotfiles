map <Leader>a :call VimuxRunCommand("clear; be rspec\n") <cr>
map <Leader>t :call VimuxRunCommand("clear; be rspec ".expand("%")."\n") <cr>
map <leader>r :!ruby %<cr>
map <leader>b :!bundle<cr>

setlocal shiftwidth=2
setlocal tabstop=2
