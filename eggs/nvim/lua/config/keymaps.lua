vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- These prevent the cursor from jumping around too much.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over and discard" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank rest of line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete into void register" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next item in quickfix list" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous item in quickfix list" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next item in location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous item in location list" })

vim.keymap.set("i", "<C-Enter>", "<C-[>o", { desc = "Open new line below current line" })
vim.keymap.set("i", "<C-S-Enter>", "<C-[>O", { desc = "Open new line above current line" })

vim.keymap.set(
  "n",
  "<leader>s#",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute current word" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable", silent = true })
