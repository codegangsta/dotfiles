-- Check if we're in VSCode context
if vim.g.vscode then
  -- VSCode extension
  local vscode = require("vscode-neovim")

  -- Set leader key
  vim.g.mapleader = "\\"

  -- Add case insensitive search settings
  vim.opt.ignorecase = true -- ignore case in search patterns
  vim.opt.smartcase = true -- override ignorecase if search contains uppercase

  -- Key mappings
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  -- File navigation
  map("n", "<C-t>", function()
    vscode.call("workbench.action.showCommands")
  end)
  map("n", "<leader>/", function()
    vscode.call("workbench.action.findInFiles")
  end)

  -- LSP actions
  map("n", "<leader><space>", function()
    vscode.call("editor.action.showHover")
  end)
  map("n", "<leader><leader>", function()
    vscode.call("editor.action.showHover")
  end)
  map("n", "<C-a>", function()
    vscode.call("editor.action.quickFix")
  end)
  map("n", "<C-n>", function()
    vscode.call("editor.action.marker.next")
  end)
  map("n", "gr", function()
    vscode.call("editor.action.goToReferences")
  end)

  -- clear search highlights in neovim with esc
  map("n", "<Esc>", function()
    vim.cmd("noh")
  end)

  -- Clipboard settings
  vim.opt.clipboard:append("unnamedplus")
else
  require("config.lazy")

  -- set colors not included in nord
  local named_colors = require("nord.named_colors")
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = named_colors.light_gray })
  vim.api.nvim_set_hl(0, "LspInlayHint", { fg = named_colors.light_gray })
end
