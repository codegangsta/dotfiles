nmap <Leader>t :call VimuxRunCommand("clear; go generate ./... && go-test-color -v ./...") <cr>
nmap <Leader>i :call VimuxRunCommand("clear; go install") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; go run *.go") <cr>
nmap <Leader>b :call VimuxRunCommand("clear; go build") <cr>
nmap <Leader>g :call VimuxRunCommand("clear; go generate -x ./...") <cr>

setlocal shiftwidth=2
setlocal tabstop=2

set completeopt-=preview
nmap <leader>d <Plug>(go-doc)
nmap gd <Plug>(go-def)
nmap gf <Plug>(go-def)
