local autocmd = vim.api.nvim_create_autocmd

-- Resize panes when wndow is resized
autocmd({"VimResized"}, {
  pattern = { "*" },
  command = "wincmd =",
})

-- Treat Brewfile as a ruby file
autocmd({"BufNewFile","BufRead"}, {
  pattern = {"BrewFile"},
  callback = function ()
    vim.api.nvim_buf_set_option(0, "syntax", "ruby")
    vim.api.nvim_buf_set_option(0, "filetype", "ruby")
  end
})

-- Autoformat go files
autocmd({"BufWritePre"}, {
  pattern = {"*.go"},
  callback = function ()
    require("go.format").goimport()
  end
})

-- Open all helptags in a vertical split
vim.cmd [[autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif]]
vim.cmd [[autocmd! BufEnter * if &ft ==# 'man' | wincmd L | endif]]
