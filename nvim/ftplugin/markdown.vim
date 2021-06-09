" Word counting in markdown
nmap <leader>w :call Send_to_Tmux("clear; wc ".expand("%")."\n") <cr>

setlocal autoindent
setlocal tw=80
setlocal whichwrap+=<,>,h,l
setlocal colorcolumn=80

highlight ColorColumn ctermbg=0
