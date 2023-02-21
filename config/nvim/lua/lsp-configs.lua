-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = require("lspconfig")
local servers = require("nvim-lsp-installer").get_installed_servers()

require("lsp-format").setup {}

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
    },
})

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
      -- kubernetes = { "*.yml", "*.yaml" }
    },
  },
}

require("neodev").setup({})

for _, server in pairs(servers) do
  if server.name == 'sumneko_lua' then
    config[server.name].setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
  else
    config[server.name].setup {
      capabilities = capabilities,
      settings = settings,
      on_attach = require("lsp-format").on_attach
    }
  end
end

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
