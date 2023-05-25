local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>e"] = "",
    ["<C-e>"] = "",
    ["<C-a>"] = "",
    ["<C-n>"] = "",
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",

    ["<up>"] = "",
    ["<down>"] = "",
  },
  i = {
    ["<up>"] = "",
    ["<down>"] = "",
  },
  v = {
    ["<up>"] = "",
    ["<down>"] = "",
  }
}

M.cmp = {
  plugin = true,

  c = {
    ["<up>"] = ":call v:lua.cmp.utils.keymap.set_map(9)<CR>",
    ["<down>"] = ":call v:lua.cmp.utils.keymap.set_map(5)<CR>",
  }
}

M.telescope = {
  plugin = true,

  n = {
    ["<C-p>"] = { ":Telescope find_files<CR>", "Find files" },
    ["<C-t>"] = { ":Telescope<CR>", "Show" },
    ["<C-c>"] = { ":Telescope commands<CR>", "Commands" },
    ["<C-s>"] = { ":Telescope diagnostics<CR>", "Diagnostics" },
    ["<leader>/"] = { ":Telescope live_grep<CR>", "Live grep" },
    ["<leader>h"] = { ":Telescope help_tags<CR>", "Help tags" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<C-e>"] = { ":NvimTreeToggle<CR>" },
    ["<leader>n"] = { ":NvimTreeToggle<CR>" },
    ["<leader>f"] = { ":NvimTreeFindFile<CR>" },
  }

}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader><space>"] = { ":Lspsaga hover_doc", "LSP Hover" },
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