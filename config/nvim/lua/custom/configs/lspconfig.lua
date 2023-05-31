local on_attach = function(client)
  require("lsp-format").on_attach(client)
  require("plugins.configs.lspconfig").on_attach(client)
end

local capabilities = require("plugins.configs.lspconfig").capabilities

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 1,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

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
    },
    format = {
      enable = true,
      -- Put format options here
      -- NOTE: the value should be STRING!!
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
      }
    },
  },
  yaml = {
    schemas = {
      -- kubernetes = { "*.yml", "*.yaml" }
    },
  },
  tsserver = {
    format = {
      enable = false,
    }
  }
}

require("mason-lspconfig").setup_handlers {
  function(server)
    require("lspconfig")[server].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = settings,
    }
  end
}

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = require("lsp-format").on_attach,
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.gofmt,
  }
})
