vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- These prevent the cursor from jumping around too much.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "gY", '"+Y', { desc = "Copy rest of line to system clipboard" })
vim.keymap.set("n", "gP", '"+P', { desc = "Paste from system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>bd", '"_d', { desc = "Delete into void register" })
vim.keymap.set("x", "<leader>bp", '"_dP', { desc = "Paste over and discard" })

vim.keymap.set(
  "n",
  "<leader>#",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute current word" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable", silent = true })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { desc = "Make current file non-executable", silent = true })

-- Unset default keybinds which I have remapped to other keys.
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")
vim.keymap.del({ "n", "v" }, "gra")
vim.keymap.del("n", "gO")

vim.keymap.set("n", "<leader>w", "<cmd>bd<cr>", { desc = "Close buffer" })
