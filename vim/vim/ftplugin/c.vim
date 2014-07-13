nmap <Leader>b :call VimuxRunCommand("clear; make && echo 'Successfully compiled!'\n") <cr>
nmap <Leader>t :call VimuxRunCommand("clear; make test && clear && ./tests/test\n") <cr>

setlocal shiftwidth=4
setlocal tabstop=4
