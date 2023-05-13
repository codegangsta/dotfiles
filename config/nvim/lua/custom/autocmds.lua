-- Resize panes when wndow is resized
local resize = vim.api.nvim_create_augroup("Resize", { clear = true })
vim.api.nvim_create_autocmd({"VimResized"}, {
  pattern = { "*" },
  command = "wincmd =",
  group = resize
})

-- Treat Brewfile as a ruby file
local brewfile = vim.api.nvim_create_augroup("Brewfile", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"}, {
  pattern = {"BrewFile"},
  callback = function ()
    vim.api.nvim_buf_set_option(0, "syntax", "ruby")
    vim.api.nvim_buf_set_option(0, "filetype", "ruby")
  end,
  group = brewfile
})

local nats_config = vim.api.nvim_create_augroup("NATSConfig", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = { "*.conf" },
  callback = function ()
    vim.cmd [[ set ft=terraform ]]
  end,
  group = nats_config
})
