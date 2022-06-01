require("plugins")
require("options")
require("mappings")
require("autocmds")
require("completion")
require("vsnip-config")

require("gitsigns").setup()

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
  position = "right",
  use_diagnostic_signs = true,
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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
