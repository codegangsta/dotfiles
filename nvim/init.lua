require("plugins")
require("options")
require("mappings")
require("autocmds")
require("completion")
require("gitsigns").setup({
  current_line_blame = true
})

-- Set Color Scheme
vim.cmd("color nord")
