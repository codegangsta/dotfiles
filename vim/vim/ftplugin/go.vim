" setlocal omnifunc=gocomplete#Complete
" set completeopt-=preview
" 
" nmap <Leader>t :call VimuxRunCommand("clear; status go test") <cr>
" nmap <Leader>e :call VimuxRunCommand("clear; status go test -bench=.") <cr>
" nmap <Leader>i :call VimuxRunCommand("clear; status go install") <cr>
" nmap <Leader>r :call VimuxRunCommand("clear; go build -o bin && ./bin") <cr>
" 

setlocal shiftwidth=2
setlocal tabstop=2

set completeopt-=preview
nmap <leader>t <Plug>(go-test)
nmap <leader>i <Plug>(go-info)
nmap <leader>d <Plug>(go-doc)
nmap <leader>r <Plug>(go-run)
nmap gd <Plug>(go-def)
