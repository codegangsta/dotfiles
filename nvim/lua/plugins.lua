return require('packer').startup(function()
  -- Packer can manage itself
  use 'christoomey/vim-tmux-navigator'
  use 'edkolev/tmuxline.vim'
  use 'ekalinin/Dockerfile.vim'
  use 'ray-x/go.nvim'
  use 'glepnir/dashboard-nvim'
  use 'godlygeek/tabular'
  use 'hashivim/vim-terraform'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'jiangmiao/auto-pairs'
  use 'lewis6991/gitsigns.nvim'
  use 'mattn/emmet-vim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  use 'pangloss/vim-javascript'
  use 'plasticboy/vim-markdown'
  use 'preservim/vimux'
  use 'rafamadriz/friendly-snippets'
  use 'rmehri01/onenord.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-rails'
  use 'tpope/vim-sensible'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'vim-ruby/vim-ruby'
  use 'wbthomason/packer.nvim'
  use 'zsiciarz/caddy.vim'
  use 'preservim/nerdtree'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }
end)
