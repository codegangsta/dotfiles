-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Automatically compile packer when this file is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'arcticicestudio/nord-vim'
  use 'chriskempson/base16-vim'
  use 'christoomey/vim-tmux-navigator'
  use 'danilo-augusto/vim-afterglow'
  use 'edkolev/tmuxline.vim'
  use 'ekalinin/Dockerfile.vim'
  use 'fatih/vim-go'
  use 'godlygeek/tabular'
  use 'hashivim/vim-terraform'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'jiangmiao/auto-pairs'
  use 'junegunn/goyo.vim'
  use 'junegunn/vim-easy-align'
  use 'lewis6991/gitsigns.nvim'
  use 'mattn/emmet-vim'
  use 'morhetz/gruvbox'
  use 'neovim/nvim-lspconfig'
  use 'pangloss/vim-javascript'
  use 'plasticboy/vim-markdown'
  use 'preservim/vimux'
  use 'scrooloose/nerdtree'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-rails'
  use 'tpope/vim-sensible'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'vim-ruby/vim-ruby'
  use 'vimwiki/vimwiki'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
