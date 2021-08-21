nmap <Leader>b :call VimuxRunCommand("clear; docker-compose build") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; docker-compose up") <cr>
nmap <Leader>d :call VimuxRunCommand("clear; docker-compose down") <cr>
nmap <Leader>c :call VimuxRunCommand("clear; docker-compose run web bash") <cr>

setlocal shiftwidth=2
setlocal tabstop=2
