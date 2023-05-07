return require('packer').startup(function()
  use 'L3MON4D3/LuaSnip'
  use 'ekalinin/Dockerfile.vim'
  use 'f3fora/cmp-spell'
  use 'folke/lsp-colors.nvim'
  use 'folke/lua-dev.nvim'
  use 'folke/todo-comments.nvim'
  use 'folke/zen-mode.nvim'
  use 'github/copilot.vim'
  use 'godlygeek/tabular'
  use 'hashivim/vim-terraform'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'jiangmiao/auto-pairs'
  use 'jjo/vim-cue'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'junegunn/vim-easy-align'
  use 'kdheepak/lazygit.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'leafgarland/typescript-vim'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lukas-reineke/lsp-format.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'onsails/lspkind.nvim'
  use 'pangloss/vim-javascript'
  use 'peitalin/vim-jsx-typescript'
  use 'plasticboy/vim-markdown'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/go.nvim'
  use 'rcarriga/nvim-notify'
  use 'rmehri01/onenord.nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'stevearc/dressing.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-rails'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'vim-ruby/vim-ruby'
  use 'vimwiki/vimwiki'
  use 'wbthomason/packer.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'zsiciarz/caddy.vim'

  use {
    'knubie/vim-kitty-navigator',
    run = "cp ./*.py ~/.config/kitty/"
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', -- github version of telescope
    -- '~/code/telescope.nvim', -- local version of telescope
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'yamatsum/nvim-nonicons',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup()
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })
end)
