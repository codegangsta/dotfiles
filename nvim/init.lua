require("plugins")

vim.cmd([[
  " Resize panes when window is resized
  :autocmd VimResized * wincmd =

  " Basic Configuration
  "
  set nocompatible                  " Must come first because it changes other options.

  set noswapfile

  syntax enable                     " Turn on syntax highlighting.
  filetype plugin indent on         " Turn on file type detection.

  set showcmd                       " Display incomplete commands.
  set showmode                      " Display the mode you're in.

  set hidden                        " Handle multiple buffers better.

  set wildmenu                      " Enhanced command line completion.
  set wildmode=list:longest         " Complete files like a shell.

  set ignorecase                    " Case-insensitive searching.
  set smartcase                     " But case-sensitive if expression contains a capital letter.

  set number                        " Show line numbers.
  set ruler                         " Show cursor position.

  set incsearch                     " Highlight matches as you type.
  set hlsearch                      " Highlight matches.

  " Color Scheme
  "
  color nord

  set wrap                          " Turn on line wrapping.
  set scrolloff=3                   " Show 3 lines of context around the cursor.

  set title                         " Set the terminal's title

  set visualbell                    " No beeping.

  " Setting shell for vim
  set shell=sh

  " Syntax Completion
  filetype plugin on
  set ofu=syntaxcomplete#Complete

  set nobackup                      " Don't make a backup before overwriting a file.
  set nowritebackup                 " And again.
  set directory=.,$TEMP  " Keep swap files in one location
  set backupdir=.,$TEMP  " Keep swap files in one location

  set expandtab                    " Use spaces instead of tabs

  set laststatus=2                  " Show the status line all the time

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

  " Vimwiki Markdown support
  let g:vimwiki_list = [{'path': '~/vimwiki',
        \'syntax': 'markdown',
        \'ext': '.md',
        \'index': 'README',
        \'links_space_char': '_',
        \'auto_tags': 1,
        \'auto_generate_tags': 1,
        \'auto_generate_links': 1,
        \'auto_diary_index': 1}]
  let g:vimwiki_markdown_link_ext = 1
  let g:vimwiki_hl_cb_checked = 2
  let g:vimwiki_auto_header = 1

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
require('lspconfig').gopls.setup{}
require('lspconfig').sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}
