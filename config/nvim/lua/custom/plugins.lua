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
        "stylua",
        "rustfmt",
        "rust-analyzer",
        "yaml-language-server",
        "emmet-ls",
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
  },
  {
    'stevearc/dressing.nvim',
    lazy = false,
    opts = {},
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}

return plugins
