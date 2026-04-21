vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- These prevent the cursor from jumping around too much.
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "gP", '"+P', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "gY", '"+y$', { desc = "Copy rest of line to system clipboard" })
vim.keymap.set("n", "<leader>y", 'mzgg"+yG`z', { desc = "Copy buffer to clipboard" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over and discard" })

vim.keymap.set("n", "<leader>w", "<cmd>bdelete<cr>", { desc = "Close buffer" })

vim.keymap.set(
  "n",
  "<leader>#",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute current word" }
)
