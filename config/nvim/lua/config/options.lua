-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt

opt.shell = "/bin/bash"
opt.relativenumber = false
opt.cursorline = false
opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

vim.g.lazyvim_picker = "telescope"

vim.g.mapleader = "\\"

vim.cmd([[
  set clipboard+=unnamedplus
]])
