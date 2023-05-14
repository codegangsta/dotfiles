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
      ensure_installed = { "html", "css", "bash", "fish", "go", "rust", "typescript" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        mappings = {
          list = {
            { key = "<C-e>", action = "" },
            { key = "s",     action = "split" },
            { key = "i",     action = "vsplit" },
            { key = "I",     action = "toggle_dotfiles" },
            { key = "?",     action = "toggle_help" },
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
    config = function()
      vim.g.lazygit_floating_window_use_plenary = 0
    end
  },
  {
    "lukas-reineke/lsp-format.nvim",
    lazy = false
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    depencencies = {
      "williamboman/mason.nvim"
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "typescript-language-server",
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua"
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    opts = {},
  },
  {
    'knubie/vim-kitty-navigator',
    lazy = false,
    build = "cp ./*.py ~/.config/kitty/"
  }
}

return plugins
