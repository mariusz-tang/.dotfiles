-- Open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Auto resize splits when the terminal's window is resized.
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})
