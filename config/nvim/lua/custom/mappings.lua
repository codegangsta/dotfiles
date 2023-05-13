local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<C-e>"] = ""
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

    -- NvimTree

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
  n = {
    -- LSP
    ["<leader><space>"] = { vim.lsp.buf.hover, "LSP Hover" },
  }
}

return M
