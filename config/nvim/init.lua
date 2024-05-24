-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- set colors not included in nord
vim.api.nvim_set_hl(0, "WinSeparator", { foreground = 2698558 })

vim.filetype.add({
  extension = {
    astro = "html",
  },
})
