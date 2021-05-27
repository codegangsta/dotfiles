" setlocal omnifunc=gocomplete#Complete
" set completeopt-=preview
" 
nmap <Leader>t :call VimuxRunCommand("clear; traffic go test ./...") <cr>
" nmap <Leader>e :call VimuxRunCommand("clear; status go test -bench=.") <cr>
nmap <Leader>i :call VimuxRunCommand("clear; traffic go install") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; go build -o gin-bin && ./gin-bin") <cr>

setlocal shiftwidth=2
setlocal tabstop=2

set completeopt-=preview
nmap <leader>d <Plug>(go-doc)
nmap gd <Plug>(go-def)
nmap gf <Plug>(go-def)
