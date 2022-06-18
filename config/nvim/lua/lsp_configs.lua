-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = require("lspconfig")
local servers = require("nvim-lsp-installer").get_installed_servers()
local settings = {
  gopls = {
    experimentalPostfixCompletions = true,
    analyses = {
      unusedparams = true,
      shadow = true,
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
      kubernetes = {"config/**/*.yml", "config/**/*.yaml"}
    },
  },
  ltex = {
    dictionary = {
      --TODO: Figure out how to get external files working with ltex
      ['en-US'] = {'NATS', 'nats', 'Caddy-NATS', 'Caddyfile', 'xcaddy'},
    }
  },
}

for _, server in pairs(servers) do
  config[server.name].setup{
    capabilities = capabilities,
    settings = settings,
  }
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references

vim.diagnostic.config({
  virtual_text = false,
})
