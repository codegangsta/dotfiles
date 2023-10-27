require "custom.autocmds"

local set = vim.api.nvim_set_option

vim.g.mapleader = "\\"

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
set("shiftwidth", 2)
set("tabstop", 2)
set("whichwrap", "")

set("shell", "/bin/bash")

vim.o.termguicolors = true

vim.g["vim_markdown_folding_disabled"] = 1

vim.g["mkdp_filetypes"] = { "markdown", "vimwiki" }

-- Vimwiki config
vim.g["vimwiki_list"] = { {
  path = "~/code/notes",
  syntax = "markdown",
  ext = ".md",
  index = "README",
  links_space_char = "_",
  auto_tags = 1,
  auto_generate_tags = 1,
  auto_generate_links = 1,
  auto_diary_index = 1,
} }
-- vim.g["vimwiki_markdown_link_ext"] = 1
vim.g["vimwiki_hl_cb_checked"] = 1
vim.g["vimwiki_auto_header"] = 1
vim.g["vimwiki_listsyms"] = " .oOx"
vim.g["vimwiki_diary_rel_path"] = "."

vim.cmd [[
  set clipboard+=unnamedplus
]]

function kitty_run_command(command, kill)
  vim.cmd(":silent !kitty @ send-text -m 'recent:1' '" .. command .. "\\n'")
end

-- Override vim.notify to do native desktop notifications in kitty
vim.notify = function(msg, level)
  vim.api.nvim_chan_send(vim.v.stderr, '\027]99;;' .. msg .. '\027\\')
end
