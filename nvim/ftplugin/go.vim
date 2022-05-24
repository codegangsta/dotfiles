nmap <Leader>t :call VimuxRunCommand("clear; go generate ./... && gotest -v") <cr>
nmap <Leader>i :call VimuxRunCommand("clear; go install") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; go run .") <cr>
nmap <Leader>b :call VimuxRunCommand("clear; go build") <cr>
nmap <Leader>m :call VimuxRunCommand("clear; make clean && make") <cr>
nmap <Leader>g :call VimuxRunCommand("clear; go get")<cr>
nmap <Leader>e :GoIfErr<cr>
nmap <Leader>l :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>:e<cr>

setlocal shiftwidth=2
setlocal tabstop=2
