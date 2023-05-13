local plugins = {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = false
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {"html", "css", "bash", "fish", "go", "rust", "typescript"},
    },
  },

}

return plugins
