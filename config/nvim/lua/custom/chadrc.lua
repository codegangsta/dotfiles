---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'nord',
  tabufline = {
    enabled = false,
    show_first_indent_level = true
  }
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
