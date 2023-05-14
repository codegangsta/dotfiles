local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<C-e>"] = "",
      ["<C-a>"] = "",
      ["<C-n>"] = "",
  }
}

M.telescope = {
plugin = true,

  n = {
    ["<C-p>"] = {":Telescope find_files<CR>", "Find files"},
    ["<C-t>"] = {":Telescope<CR>", "Show"},
    ["<C-c>"] = {":Telescope commands<CR>", "Commands"},
    ["<C-s>"] = {":Telescope diagnostics<CR>", "Diagnostics"},
    ["<leader>/"] = {":Telescope live_grep<CR>", "Live grep"},
    ["<leader>h"] = {":Telescope help_tags<CR>", "Help tags"},
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<C-e>"] = {":NvimTreeToggle<CR>"},
    ["<leader>n"] = {":NvimTreeToggle<CR>"},
    ["<leader>f"] = {":NvimTreeFindFile<CR>"},
  }

}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader><space>"] = { vim.lsp.buf.hover, "LSP Hover" },
    ["<leader><leader>"] = { vim.diagnostic.open_float, "Open float" },
    ["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
    ["<C-a>"] = { vim.lsp.buf.code_action, "Code action" },
    ["<C-n>"] = { vim.diagnostic.goto_next, "Go to next" },
  }
}

M.lazygit = {
  n = {
    ["<C-g>"] = { ":LazyGit<CR>" },
    ["<C-b>"] = { ":LazyGitFilterCurrentFile<CR>" },
  }

}

return M
