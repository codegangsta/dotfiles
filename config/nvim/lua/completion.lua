-- Setup nvim-cmp.

  local lspkind = require'lspkind'
  local cmp = require'cmp'

  cmp.setup({

    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = 50,

        before = function (_, vim_item)
          return vim_item
        end
      })
    },

    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<TAB>'] = cmp.mapping.confirm({ select = false }),
    }),

    sources = cmp.config.sources({
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }),

    experimental = {
      ghost_text = true
    },
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'nvim_lsp_document_symbol' },
      { name = 'buffer' }
    }
  })

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = require("lspconfig")

config.gopls.setup {
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

config.sumneko_lua.setup{
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}

config.yamlls.setup{
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = { kubernetes = "*.yml" },
    }
  }
}

config.tsserver.setup{}
config.rust_analyzer.setup{}

vim.diagnostic.config({
  virtual_text = false,
})
