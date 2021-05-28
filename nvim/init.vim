" My vim plugins
"
call plug#begin(stdpath('data') . '/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/vim-easy-align'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sensible'
  Plug 'preservim/vimux'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Basic Configuration
"
set nocompatible                  " Must come first because it changes other options.

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
set t_Co=256
color Tomorrow-Night
hi Search term=reverse cterm=reverse gui=reverse ctermfg=237

" Show trailing whitespace:
"
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" NERDTree
let NERDTreeShowHidden=0

" FZF
set rtp+=/usr/local/opt/fzf
nmap <C-P> :FZF<CR>

" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"

" Splitting
map <Leader>- :split<CR>
map <Leader><bar> :vsplit<CR>

map <leader>n :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
map <leader>g :Git<Space>
map <leader>/ :Ack<Space>
map <leader>p :YRShow<cr>

" Removing search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>

" split naviagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Relative line numbers
function! NumberToggle()
        if(&relativenumber == 1)
                set number
        else
                set relativenumber
        endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

autocmd BufNewFile,BufRead *.thor set syntax=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
