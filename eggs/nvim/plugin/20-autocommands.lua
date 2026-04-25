-- Enable highlighting when it does not start automatically.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitconfig", "tex" },
  command = "lua vim.treesitter.start()",
})

-- Auto resize splits when the terminal's window is resized.
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})
