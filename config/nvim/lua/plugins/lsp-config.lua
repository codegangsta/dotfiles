return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader><space>", vim.lsp.buf.hover, { desc = "Hover doc" } },
      { "<leader><leader>", vim.diagnostic.open_float, { desc = "Show line diagnostics" } },
      { "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" } },
      { "<C-a>", vim.lsp.buf.code_action, { desc = "Code action" } },
      { "<C-n>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" } },
    },
    opts = {
      document_highlight = false,
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
