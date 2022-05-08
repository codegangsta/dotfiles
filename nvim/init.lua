require("plugins")
require("options")
require("mappings")
require("autocmds")
require("completion")

require("gitsigns").setup({
  current_line_blame = true
})

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
})

require("nvim-tree").setup()

-- Set Color Scheme
vim.cmd("color nord")
