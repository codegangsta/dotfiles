nmap <leader>r :!go run % <cr>
nmap <Leader>t :!go test -tags test <cr>
nmap <Leader>t :call Send_to_Tmux("clear; go test --tags test\n") <cr>
nmap <Leader>i :!go install <cr>
nmap <Leader>y :Fmt <cr>
