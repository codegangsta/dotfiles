return {
  {
    "knubie/vim-kitty-navigator",
    lazy = false,
    build = "cp ./*.py ~/.config/kitty/",

    keys = {
      { "<C-h>", "<cmd>KittyNavigateLeft<cr>", { desc = "Go to Left Window" } },
      { "<C-j>", "<cmd>KittyNavigateDown<cr>", { desc = "Go to Lower Window", remap = true } },
      { "<C-k>", "<cmd>KittyNavigateUp<cr>", { desc = "Go to Upper Window", remap = true } },
      { "<C-l>", "<cmd>KittyNavigateRight<cr>", { desc = "Go to Right Window", remap = true } },
    },
  },
}
