-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt

opt.shell = "/bin/bash"
opt.relativenumber = false
opt.cursorline = false
opt.wrap = true

vim.g.mapleader = "\\"

vim.cmd([[
  set clipboard+=unnamedplus
]])
