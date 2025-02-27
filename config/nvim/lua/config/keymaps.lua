-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- LazyGit
map("n", "<C-g>", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })

map("n", "<leader>a", "<cmd>CodeCompanionActions<cr>", { desc = "Open CodeCompanion actions" })
map("v", "<leader>a", "<cmd>CodeCompanionActions<cr>", { desc = "Open CodeCompanion actions" })
map("n", "<C-x>", "<cmd>CodeCompanionChat<cr>", { desc = "Open CodeCompanion chat" })
map("v", "<C-x>", "<cmd>CodeCompanionChat<cr>", { desc = "Open CodeCompanion chat" })
map("n", "<leader>x", "<cmd>CodeCompanion", { desc = "Open CodeCompanion inline" })
map("v", "<leader>x", "<cmd>CodeCompanion", { desc = "Open CodeCompanion inline" })
