local lspkind = require 'lspkind'
local cmp = require 'cmp'

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,

      before = function(_, vim_item)
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
    { name = 'nvim_lsp_signature_help' },
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
  }),

  experimental = {
    ghost_text = true
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'nvim_lsp_document_symbol' },
    { name = 'buffer' }
  }
})
