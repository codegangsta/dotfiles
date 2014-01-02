setlocal omnifunc=gocomplete#Complete
set completeopt-=preview

nmap <leader>r :!tmux send-keys -t 1 C-c <cr> :call Send_to_Tmux("clear && go build -o bin && ./bin \n") <cr>
nmap <Leader>t :call Send_to_Tmux("clear; go test --tags test ./...\n") <cr>
nmap <Leader>e :call Send_to_Tmux("clear; go test -bench=.\n") <cr>
nmap <Leader>i :call Send_to_Tmux("clear; go install\n") <cr>
nmap <Leader>y :Fmt <cr> :w <cr>
nmap <Leader>d :Godoc <cr>
nmap <Leader>p :!clear && go build -o bin && ./bin <cr>

setlocal shiftwidth=2
setlocal tabstop=2
