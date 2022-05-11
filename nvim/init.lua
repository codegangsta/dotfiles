require("plugins")
require("options")
require("mappings")
require("autocmds")
require("completion")
require("vsnip-config")

require("gitsigns").setup()

require("nvim-tree").setup({
  open_on_setup = false,
  disable_netrw = true,
  hijack_netrw = false,
  diagnostics = {
    enable = true
  },
  view = {
    mappings = {
      list = {
        { key = "<C-e>", action = "" },
        { key = "<C-t>", action = "" },
      }
    }
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

require("trouble").setup({
  position = "right",
  use_diagnostic_signs = true,
  action_keys = {
    open_tab = {}
  }
})

require('hop').setup({
  keys = 'etovxqpdygfblzhckisuran'
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
