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
    ["<leader><space>"] = { "<cmd>Lspsaga hover_doc <cr>", "Hover doc" },
    ["<leader><leader>"] = { "<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>", "Show line diagnostics" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<cr>", "Show outline" },
    ["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
    ["gp"] = { "<cmd>Lspsaga peek_definition <cr>", "Peek definition" },
    ["gr"] = { "<cmd>Lspsaga rename <cr>", "Rename" },
    ["<C-a>"] = { "<cmd>Lspsaga code_action <cr>", "Code action" },
    ["<C-n>"] = { "<cmd>Lspsaga diagnostic_jump_next <cr>", "Go to next" },
    ["<C-f>"] = { "<cmd>Lspsaga lsp_finder <cr>", "LSP Finder" },
  }
}

M.lazygit = {
  n = {
    ["<C-g>"] = { ":LazyGit<CR>" },
    ["<C-b>"] = { ":LazyGitFilterCurrentFile<CR>" },
  }

}

return M
