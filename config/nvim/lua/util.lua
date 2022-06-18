local ts_locals = require "nvim-treesitter.locals"
local ts_utils = require "nvim-treesitter.ts_utils"

function get_parent_function_name()
  local cursor_node = ts_utils.get_node_at_cursor()
  local scope = ts_locals.get_scope_tree(cursor_node, 0)

  local function_node
  for _, v in ipairs(scope) do
    if v:type() == "function_declaration" then
      function_node = v
      break
    end
  end

  if function_node then
    return vim.treesitter.get_node_text(function_node:child(1), 0)
  else
    return nil
  end
end
