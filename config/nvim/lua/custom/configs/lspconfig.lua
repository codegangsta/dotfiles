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
  },
  xml = {
    format = {
      enabled = false,
    },
    fileAssociations = {
      {
        pattern = "Mutagen/*/Records/*/*.xml",
        systemId = "Mutagen.Bethesda.Core/MutagenSource.xsd"
      }
    },
  }
}

require("lspconfig")["sourcekit"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "/usr/bin/sourcekit-lsp" },
  settings = {
    sourcekit = {
      enableDiagnostics = true,
    }
  }
}

require("mason-lspconfig").setup_handlers {
  function(server)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = settings,
    }
    if server == "omnisharp" then
      opts.cmd = { "/Users/jeremysaenz/.local/share/nvim/mason/bin/omnisharp", "--languageserver", "--hostPID",
        tostring(vim.fn.getpid()) }
    end
    require("lspconfig")[server].setup(opts)
  end
}

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = require("lsp-format").on_attach,
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.gofmt,
  }
})
