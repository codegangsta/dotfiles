" Word counting in markdown
nmap <leader>w :call Send_to_Tmux("clear; wc ".expand("%")."\n") <cr>
