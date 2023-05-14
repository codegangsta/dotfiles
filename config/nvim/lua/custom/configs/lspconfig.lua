local on_attach = function(client)
  require("lsp-format").on_attach(client)
  require("plugins.configs.lspconfig").on_attach(client)
end

local capabilities = require("plugins.configs.lspconfig").capabilities

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
