---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'nord',
  tabufline = {
    enabled = false,
  },
  statusline = {
    theme = "default",

    overriden_modules = function()
      return {
        LSP_progress = function()
          return ""
        end
      }
    end
  },
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
