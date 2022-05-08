local function map(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Splitting windows
map("", "<leader>-", ":split<cr>")
map("", "<leader><bar>", ":vsplit<cr>")

-- Telescope Mappings
map("n", "<C-P>", ":Telescope find_files<cr>")
map("n", "<leader>h", ":Telescope help_tags<cr>")
map("n", "<leader>t", ":Telescope<cr>")

-- NERDTree
map("", "<leader>n", ":NERDTreeToggle<cr>")
map("", "<leader>f", ":NERDTreeFind<cr>")

map("n", "<leader>s", ":Gitsigns stage_buffer<cr>")
map("n", "<leader>u", ":Gitsigns reset_buffer<cr>")

-- LSP
map("", "<leader><space>", "", { callback = vim.lsp.buf.hover })

-- Make
map("", "<leader>m", ":VimuxRunCommand 'clear; make'<cr>")

-- Split Navigation
map("n", "<C-J>", "<C-W><C-J>", { noremap = true })
map("n", "<C-K>", "<C-W><C-K>", { noremap = true })
map("n", "<C-L>", "<C-W><C-L>", { noremap = true })
map("n", "<C-H>", "<C-W><C-H>", { noremap = true })

-- j and k remapping
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })
