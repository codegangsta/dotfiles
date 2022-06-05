local function map(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Splitting windows
map("", "<leader>-", ":split<cr>")
map("", "<leader><bar>", ":vsplit<cr>")

-- Removing highlghts
map("n", "<esc>", ":noh<CR><esc>", { noremap = true, silent = true })

-- Telescope Mappings
map("n", "<C-P>", ":Telescope find_files<cr>")
map("n", "<C-t>", ":Telescope<cr>")
map("n", "<leader>h", ":Telescope help_tags<cr>")

-- NERDTree
map("", "<C-e>", ":NERDTreeToggle<cr>")
map("", "<leader>n", ":NERDTreeToggle<cr>")
map("", "<leader>f", ":NERDTreeFind<cr>")

-- Gitsigns config
map("n", "<leader>s", ":Gitsigns stage_buffer<cr>")
map("n", "<leader>u", ":Gitsigns reset_buffer<cr>")

-- Make
map("", "<leader>m", ":VimuxRunCommand 'clear; make'<cr>")

-- Split Navigation
map("n", "<C-J>", "<C-W><C-J>", { noremap = true })
map("n", "<C-K>", "<C-W><C-K>", { noremap = true })
map("n", "<C-L>", "<C-W><C-L>", { noremap = true })
map("n", "<C-H>", "<C-W><C-H>", { noremap = true })

map("n", "<C-G>", ":LazyGit<CR>", { noremap = true })

-- j and k remapping
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })

-- Hop
map("n", "f", "", { callback = require("hop").hint_words })

-- LSP
map("", "<leader><space>", "", { callback = vim.lsp.buf.hover })
map("", "<leader>d", "", { callback = PeekDefinition })
map("n", "gD", "", { callback = vim.lsp.buf.declaration })
map("n", "gd", "", { callback = vim.lsp.buf.definition })
map("n", "K", "", { callback = vim.lsp.buf.hover })
map("n", "gi", "", { callback = vim.lsp.buf.implementation })
map("n", "<leader>ca", "", { callback = vim.lsp.buf.code_action })
map("n", "gr", "", { callback = vim.lsp.buf.references })
