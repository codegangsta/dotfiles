" My vim plugins
"
call plug#begin(stdpath('data') . '/plugged')
  Plug 'arcticicestudio/nord-vim'
  Plug 'chriskempson/base16-vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  Plug 'godlygeek/tabular'
  Plug 'hashivim/vim-terraform'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'mattn/emmet-vim'
  Plug 'morhetz/gruvbox'
  Plug 'neovim/nvim-lspconfig'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'preservim/vimux'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'vim-ruby/vim-ruby'
  Plug 'vimwiki/vimwiki'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'ray-x/go.nvim'
call plug#end()

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
nmap <C-F> :Ag<cr>

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
map <leader>s :source ~/.dotfiles/nvim/init.vim<cr>
map <leader><space> :lua vim.lsp.buf.hover()<cr>
map <Leader>m :call VimuxRunCommand("clear; make") <cr>

" Removing search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>

" split naviagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap j gj
nnoremap k gk

" Move items between buffers
nnoremap H dd <C-W><C-H> Gp
nnoremap L dd <C-W><C-L> Gp

autocmd BufNewFile,BufRead *.thor set syntax=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby

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

lua require'lspconfig'.gopls.setup{}

" set completeopt=menuone,noselect

set shiftwidth=2
set tabstop=2

" neovim cmp
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF

" FZF spelling
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

" Vimwiki Tagging
function! VimwikiToggleTag(tag)
  call cursor(line("v"), 1)
  let l:tag = ":".a:tag.":"
  if search(l:tag, "n", line("v")) > 0
    call setline(line("."), substitute(getline("."), " *".l:tag, "", "g"))
  else
    call setline(line("."), substitute(getline("."), " *$", " ".l:tag, "g"))
  endif
endfunction
