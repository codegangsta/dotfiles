return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "gopls",
        "terraform-ls",
        "css-lsp",
      },
    },
  },
}
