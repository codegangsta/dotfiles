return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  keys = {
    {
      "<leader>d",
      function()
        vim.cmd("DBUIToggle")
      end,
      { desc = "Toggle DBUI" },
    },
    {
      "<C-d>",
      function()
        vim.cmd("DBUIToggle")
      end,
      { desc = "Toggle DBUI" },
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
