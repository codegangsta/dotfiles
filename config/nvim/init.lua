require("onenord").setup({
  theme = "dark",
  disable = {
    background = true
  }
})
require "plugins"
require "options"
require "mappings"
require "autocmds"
require "completion"
-- setup lsp installer before we setup our configs
require "nvim-lsp-installer".setup {}
require "lsp-configs"
require "globals"
require "codegangsta.telescope.setup"
require "codegangsta.luasnip"

require("nvim-web-devicons").setup({
  default = true
})

require("gitsigns").setup({
})

vim.notify = require("notify")

require('hop').setup({
  keys = 'etovxqpdygfblzhckisuran'
})

require("zen-mode").setup {
  window = {
    backdrop = 0,
    options = {
      number = true
    }
  },
  plugins = {
    gitsigns = {
      enabled = true
    },
  }
}

require('todo-comments').setup {}

require('go').setup()

require('lualine').setup {
  sections = {
    lualine_c = {
      {
        "filename",
        path = 1
      }
    }
  }
}

require('nvim-tree').setup {
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

require('lsp-colors').setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
}

require('indent_blankline').setup({ })

require('dressing').setup {}

function kitty_run_command(command)
  -- kitty @ send-text --match "recent:1" hey there
  vim.cmd(":silent !kitty @ send-text -m 'recent:1' '" .. command .. "\\n'")
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Spelling undercurl
vim.cmd [[
  hi clear SpellBad
  hi SpellBad cterm=underline
  " Set style for gVim
  hi SpellBad gui=undercurl guisp=red
]]
