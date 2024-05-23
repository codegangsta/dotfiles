return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><space>", false },
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<C-t>", "<cmd>Telescope<cr>", desc = "Show" },
    { "<C-c>", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<C-s>", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  },
}
