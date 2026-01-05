return {
  {
    "nvim-mini/mini.align",
    version = "*",
    lazy = false,
    config = function()
      require("mini.align").setup()
    end,
  },
}
