---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'nord',
  tabufline = {
    enabled = false,
  },
  statusline = {
    theme = "default"
  },
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
