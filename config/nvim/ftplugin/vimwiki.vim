map <leader><Space> :VimwikiToggleListItem<cr>

setlocal spell
setlocal shiftwidth=4
setlocal nonumber
setlocal signcolumn=no

nnoremap <silent> 0 :call VimwikiToggleTag("waiting")<cr>
nnoremap <silent> 1 :call VimwikiToggleTag("5m")<cr>
nnoremap <silent> 2 :call VimwikiToggleTag("15m")<cr>
nnoremap <silent> 3 :call VimwikiToggleTag("30m")<cr>
nnoremap <silent> 4 :call VimwikiToggleTag("1h")<cr>
