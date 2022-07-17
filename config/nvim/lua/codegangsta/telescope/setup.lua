require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "vendor" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}
require("telescope").load_extension("ui-select")
