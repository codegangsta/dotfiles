-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Treat Brewfile as a ruby file
local brewfile = vim.api.nvim_create_augroup("Brewfile", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "BrewFile" },
  callback = function()
    vim.cmd([[ set ft=ruby ]])
  end,
  group = brewfile,
})

local nats_config = vim.api.nvim_create_augroup("NATSConfig", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.conf" },
  callback = function()
    vim.cmd([[ set ft=terraform ]])
  end,
  group = nats_config,
})

local markdoc = vim.api.nvim_create_augroup("Markdoc", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.mdoc" },
  callback = function()
    vim.cmd([[ set ft=markdown ]])
  end,
  group = markdoc,
})

-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = bool_val
    end,
  })
end

set_autoformat({ "markdown" }, false)
