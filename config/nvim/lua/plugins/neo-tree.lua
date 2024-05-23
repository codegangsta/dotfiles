return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<C-e>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
    },
    {
      "<leader>f",
      "<cmd>Neotree reveal<cr>",
    },
  },
}
