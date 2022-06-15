local set = vim.api.nvim_set_option

-- Basic Options
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
set("completeopt", "menu,menuone,noselect")

vim.o.termguicolors = true

-- Vim Markdown Config
vim.g["vim_markdown_folding_disabled"] = 1

-- Vimwiki config
vim.g["vimwiki_list"] = { {
  path = "~/Dropbox/wiki",
  syntax = "markdown",
  ext = ".md",
  index = "README",
  links_space_char = "_",
  auto_tags = 1,
  auto_generate_tags = 1,
  auto_generate_links = 1,
  auto_diary_index = 1,
} }
vim.g["vimwiki_markdown_link_ext"] = 1
vim.g["vimwiki_hl_cb_checked"] = 1
vim.g["vimwiki_auto_header"] = 1
vim.g["vimwiki_listsyms"] = " .oOx"
vim.g["vimwiki_folding"] = "list"
