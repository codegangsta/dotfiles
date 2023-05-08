-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = require("lspconfig")
local servers = require("nvim-lsp-installer").get_installed_servers()

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

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
  config[server.name].setup {
    capabilities = capabilities,
    settings = settings,
    on_attach = require("lsp-format").on_attach
  }
end

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
