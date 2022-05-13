nmap <Leader>t :call VimuxRunCommand("clear; go generate ./... && gotest -v") <cr>
nmap <Leader>i :call VimuxRunCommand("clear; go install") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; go run .") <cr>
nmap <Leader>b :call VimuxRunCommand("clear; go build") <cr>
nmap <Leader>g :call VimuxRunCommand("clear; go generate -x ./...") <cr>
nmap <Leader>m :call VimuxRunCommand("clear; make clean && make") <cr>

setlocal shiftwidth=2
setlocal tabstop=2
