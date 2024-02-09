map <Leader>p       :MarkdownPreview<cr>

setlocal shiftwidth=4
setlocal wrap
setlocal linebreak
setlocal textwidth=0

" disable autocompletion for markdown files. Can still use mappings to trigger cmp
lua require('cmp').setup.buffer { completion = { autocomplete = false } }
