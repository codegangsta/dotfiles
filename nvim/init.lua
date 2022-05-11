require("plugins")
require("options")
require("mappings")
require("autocmds")
require("completion")

require("gitsigns").setup({
  current_line_blame = true
})

require("nvim-tree").setup({
  open_on_setup = true,
  disable_netrw = true,
  diagnostics = {
    enable = true
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      },
      resize_window = true
    }
  },
})

require("nvim-web-devicons").setup({
  default = true
})

require("onenord").setup({
  theme = "dark"
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
