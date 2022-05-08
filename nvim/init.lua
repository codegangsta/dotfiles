require("plugins")
require("options")

-- Resize panes when wndow is resized
vim.api.nvim_create_autocmd({"VimResized"}, {
  pattern = { "*" },
  command = "wincmd =",
})


vim.cmd([[
  " Color Scheme
  "
  color nord

  " FZF
  set rtp+=/usr/local/opt/fzf
  nmap <C-P> :FZF<CR>
  nmap <C-F> :Telescope live_grep<cr>

  " Map cursor for insert mode
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"

  " Splitting
  map <Leader>- :split<CR>
  map <Leader><bar> :vsplit<CR>

  map <leader>n :NERDTreeToggle<cr>
  map <leader>f :NERDTreeFind<cr>
  map <leader>/ :Ag<cr>
  map <leader>h :History:<cr>
  map <leader>s :source ~/.dotfiles/nvim/init.lua<cr>
  map <leader><space> :lua vim.lsp.buf.hover()<cr>
  map <Leader>m :call VimuxRunCommand("clear; make") <cr>
  map <Leader>t :Telescope<cr>

  " Removing search highlighting
  nnoremap <ESC><ESC> :nohlsearch<CR>

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

  " Vim Surround
  let g:surround_42 = "**\r**"

  " Insert Date
  inoremap <F5> <C-R>=strftime("%b %d, %Y")<CR>
  inoremap <F6> <C-R>=strftime("%H:%M")<CR>

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
