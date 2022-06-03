require("plugins")
require("peek-definition")
require("options")
require("mappings")
require("autocmds")
require("completion")
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

require("trouble").setup({
  use_diagnostic_signs = true,
  auto_close = true,
  mode = "document_diagnostics",
  action_keys = {
    open_tab = {}
  }
})

require('hop').setup({
  keys = 'etovxqpdygfblzhckisuran'
})

require('telescope').setup{
  defaults = {
    -- TODO: Find a better way to do this through reading .gitignore
    file_ignore_patterns = { "node_modules" }
  }
}

require('go').setup()

require('lualine').setup()

require('lsp-colors').setup{
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
