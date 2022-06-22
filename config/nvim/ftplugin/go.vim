nmap <Leader>t :lua kitty_run_command(string.format("gotest -race %s/*.go", vim.fn.expand("%:p:h"))) <cr>
nmap <Leader>a :lua kitty_run_command("gotest -race ./...") <cr>
nmap <Leader>l :lua kitty_run_command(string.format("gotest -race ./... -run %s", get_parent_function_name())) <cr>

nmap <Leader>i :lua kitty_run_command("go install") <cr>
nmap <Leader>r :lua kitty_run_command("go run .") <cr>
nmap <Leader>b :lua kitty_run_command("go build") <cr>
nmap <Leader>g :lua kitty_run_command("go get")<cr>
nmap <Leader>e :GoIfErr<cr>
" nmap <Leader>l :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>:e<cr>

command! -buffer A GoAlt
command! -buffer AV GoAltV
command! -buffer AS GoAltS

setlocal shiftwidth=2
setlocal tabstop=2
