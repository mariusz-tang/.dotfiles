-- Enable highlighting when filetype is specified by modeline.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitconfig",
  command = "lua vim.treesitter.start()",
})

-- Auto resize splits when the terminal's window is resized.
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})
