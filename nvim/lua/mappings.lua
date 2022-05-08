local map = vim.api.nvim_set_keymap

-- Splitting windows
map("", "<Leader>-", ":split<CR>", {})
map("", "<Leader><bar>", ":vsplit<CR>", {})
