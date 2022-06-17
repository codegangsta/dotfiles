nmap <Leader>t :lua kitty_run_command("clear; go generate ./... && gotest -v") <cr>
nmap <Leader>i :lua kitty_run_command("clear; go install") <cr>
nmap <Leader>r :lua kitty_run_command("clear; go run .") <cr>
nmap <Leader>b :lua kitty_run_command("clear; go build") <cr>
nmap <Leader>g :lua kitty_run_command("clear; go get")<cr>
nmap <Leader>e :GoIfErr<cr>
nmap <Leader>l :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>:e<cr>

command! -buffer A GoAlt
command! -buffer AV GoAltV
command! -buffer AS GoAltS

setlocal shiftwidth=2
setlocal tabstop=2
