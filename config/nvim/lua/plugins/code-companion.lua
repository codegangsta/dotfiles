return {
  {
    "olimorris/codecompanion.nvim",
    config = {
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        },
      },
      ui = {
        notify = {
          enabled = false, -- Disable nvim-notify
        },
        progress = {
          enabled = true,
          spinner = true, -- Enable spinner
          backend = "fidget", -- Use fidget.nvim
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim", -- Add fidget.nvim dependency
    },
  },
}
