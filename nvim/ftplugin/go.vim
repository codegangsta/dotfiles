nmap <Leader>t :call VimuxRunCommand("clear; traffic go test ./...") <cr>
nmap <Leader>i :call VimuxRunCommand("clear; traffic go install") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; go build -o gin-bin && ./gin-bin") <cr>

set completeopt-=preview
nmap <leader>d <Plug>(go-doc)
nmap gd <Plug>(go-def)
nmap gf <Plug>(go-def)
