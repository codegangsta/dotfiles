require("plugins")
require("options")
require("mappings")
require("autocmds")
require("completion")
require("lsp_configs")
require("vsnip-config")

require("gitsigns").setup({
})

require("nvim-web-devicons").setup({
  default = true
})

require("onenord").setup({
  theme = "dark",
  disable = {
    background = true
  }
})

require('hop').setup({
  keys = 'etovxqpdygfblzhckisuran'
})

require('telescope').setup{}

require('todo-comments').setup{}

require('go').setup()

require('lualine').setup()

require('nvim-tree').setup{
  open_on_setup = true,
  view = {
    mappings = {
      list = {
        { key = "<C-e>", action = "" },
        { key = "s", action = "split" },
        { key = "i", action = "vsplit" },
        { key = "?", action = "toggle_help" },
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
}

require('lsp-colors').setup{
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
}

require('lsp_signature').setup{
  hint_enable = false,
  always_trigger = true,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
