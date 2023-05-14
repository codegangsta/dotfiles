---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'nord',
  tabufline = {
    enabled = false,
    show_first_indent_level = true
  }
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.autocmds = require "custom.autocmds"

vim.g.mapleader = "\\"

local set = vim.api.nvim_set_option
set("swapfile", false)
set("compatible", false)
set("showcmd", true)
set("showmode", true)
set("hidden", true)
set("wildmenu", true)
set("wildmode", "list:longest")
set("ignorecase", true)
set("smartcase", true)
set("incsearch", true)
set("hlsearch", true)
set("wrap", true)
set("scrolloff", 3)
set("number", true)
set("ruler", true)
set("title", true)
set("backup", false)
set("writebackup", false)
set("expandtab", true)
set("laststatus", 2)
set("shiftwidth", 2)
set("tabstop", 2)
set("laststatus", 3)

return M
