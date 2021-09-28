map <leader><Space> :VimwikiToggleListItem<cr>
map <Leader>p       :MarkdownPreview<cr>
map <leader>g       :Goyo<cr>
map <Leader>s       :VimuxRunCommand("clear; git-sync")<cr>

setlocal spell
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap 0 :call VimwikiToggleTag("waiting")<cr>
nnoremap 1 :call VimwikiToggleTag("5m")<cr>
nnoremap 2 :call VimwikiToggleTag("15m")<cr>
nnoremap 3 :call VimwikiToggleTag("30m")<cr>
nnoremap 4 :call VimwikiToggleTag("1h")<cr>
