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
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        mappings = {
          list = {
            { key = "<C-e>", action = "" },
            { key = "s", action = "split" },
            { key = "i", action = "vsplit" },
            { key = "I", action = "toggle_dotfiles" },
            { key = "?", action = "toggle_help" },
          }
        }
      },
      renderer = {
        indent_markers = {
          enable = true
        }
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false
          },
        }
      },
    }
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  }
}

return plugins
