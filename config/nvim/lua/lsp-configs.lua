-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = require("lspconfig")
local servers = require("nvim-lsp-installer").get_installed_servers()

require("lsp-format").setup {}

local settings = {
  gopls = {
    experimentalPostfixCompletions = true,
    analyses = {
      unusedparams = true,
    },
    staticcheck = true,
  },
  Lua = {
    diagnostics = {
      globals = { 'vim', 'use' }
    }
  },
  yaml = {
    schemas = {
      kubernetes = { "config/**/*.yml", "config/**/*.yaml" }
    },
  },
}

local luadev = require("lua-dev").setup({
  lspconfig = settings
})

for _, server in pairs(servers) do
  if server.name == 'sumneko_lua' then
    config[server.name].setup(luadev)
  else
    config[server.name].setup {
      capabilities = capabilities,
      settings = settings,
      on_attach = require("lsp-format").on_attach
    }
  end
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- TODO: Add this to autocommands file
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references

vim.diagnostic.config({
  virtual_text = false,
})
