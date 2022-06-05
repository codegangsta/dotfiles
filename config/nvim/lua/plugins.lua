local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'christoomey/vim-tmux-navigator'
  use 'edkolev/tmuxline.vim'
  use 'ekalinin/Dockerfile.vim'
  use 'folke/lsp-colors.nvim'
  use 'glepnir/dashboard-nvim'
  use 'godlygeek/tabular'
  use 'hashivim/vim-terraform'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'jiangmiao/auto-pairs'
  use 'leafgarland/typescript-vim'
  use 'lewis6991/gitsigns.nvim'
  use 'mattn/emmet-vim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  use 'pangloss/vim-javascript'
  use 'peitalin/vim-jsx-typescript'
  use 'plasticboy/vim-markdown'
  use 'preservim/nerdtree'
  use 'preservim/vimux'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/go.nvim'
  use 'ray-x/lsp_signature.nvim'
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
  use 'kdheepak/lazygit.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
