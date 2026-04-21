vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim" })
require("yazi").setup({
  open_for_directories = true,
  highlight_hovered_buffers_in_same_directory = false,
})

-- Do not open netrw for directories.
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>e", "<cmd>Yazi<CR>", { desc = "Open yazi" })
vim.keymap.set("n", "<leader>E", "<cmd>Yazi cwd<CR>", { desc = "Open yazi in cwd" })
