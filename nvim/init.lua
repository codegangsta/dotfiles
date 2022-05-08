require("plugins")
require("options")

-- Resize panes when wndow is resized
vim.api.nvim_create_autocmd({"VimResized"}, {
  pattern = { "*" },
  command = "wincmd =",
})

-- Set Color Scheme
vim.cmd("color nord")

vim.cmd([[
  " Splitting
  map <Leader>- :split<CR>
  map <Leader><bar> :vsplit<CR>

  nmap <C-P> :Telescope find_files<cr>
  nmap <leader>h :Telescope help_tags<cr>

  map <leader>n :NERDTreeToggle<cr>
  map <leader>f :NERDTreeFind<cr>
  map <leader>s :source ~/.dotfiles/nvim/init.lua<cr>
  map <leader><space> :lua vim.lsp.buf.hover()<cr>
  map <Leader>m :call VimuxRunCommand("clear; make") <cr>
  map <Leader>t :Telescope<cr>

  " split naviagation
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  nnoremap j gj
  nnoremap k gk

  autocmd BufNewFile,BufRead *.thor set syntax=ruby
  autocmd BufNewFile,BufRead *.thor set filetype=ruby

  autocmd BufNewFile,BufRead Brewfile set syntax=ruby
  autocmd BufNewFile,BufRead Brewfile set filetype=ruby

  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

  " Vim Markdown config
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_new_list_item_indent = 2
  set conceallevel=2

  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  " autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

  " set completeopt=menuone,noselect

  set shiftwidth=2
  set tabstop=2

  lua require('gitsigns').setup()

  " neovim cmp
  set completeopt=menu,menuone,noselect
]])

require("completion")
