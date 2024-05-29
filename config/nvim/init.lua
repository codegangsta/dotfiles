-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- set colors not included in nord
local named_colors = require("nord.named_colors")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = named_colors.light_gray })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = named_colors.light_gray })
