map <Leader>p       :MarkdownPreview<cr>

setlocal shiftwidth=4

# disable autocompletion for markdown files. Can still use mappings to trigger cmp
lua require('cmp').setup.buffer { completion = { autocomplete = false } }
