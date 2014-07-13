setlocal omnifunc=gocomplete#Complete
set completeopt-=preview

nmap <Leader>t :call VimuxRunCommand("clear; status go test") <cr>
nmap <Leader>e :call VimuxRunCommand("clear; status go test -bench=.") <cr>
nmap <Leader>i :call VimuxRunCommand("clear; status go install") <cr>
nmap <Leader>r :call VimuxRunCommand("clear; go build -o bin && ./bin") <cr>

nmap <Leader>y :Fmt <cr> :w <cr>
nmap <Leader>d :Godoc <cr>

setlocal shiftwidth=2
setlocal tabstop=2
