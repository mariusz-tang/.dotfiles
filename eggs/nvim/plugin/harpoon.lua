vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" } })
local harpoon = require("harpoon")

---@diagnostic disable-next-line: missing-parameter
harpoon.setup()

local default_list = harpoon:list()

local function add_to_list()
  default_list:add()
end

local function replace_at(idx)
  return function()
    default_list:replace_at(idx)
  end
end

local function toggle_quick_menu()
  harpoon.ui:toggle_quick_menu(default_list)
end

local function select(idx)
  return function()
    default_list:select(idx)
  end
end

vim.keymap.set("n", "<C-e>", toggle_quick_menu, { desc = "Toggle harpoon quick menu" })

vim.keymap.set("n", "<leader>ha", add_to_list, { desc = "Add buffer" })
vim.keymap.set("n", "<leader>h1", replace_at(1), { desc = "Put buffer in position 1" })
vim.keymap.set("n", "<leader>h2", replace_at(2), { desc = "Put buffer in position 2" })
vim.keymap.set("n", "<leader>h3", replace_at(3), { desc = "Put buffer in position 3" })
vim.keymap.set("n", "<leader>h4", replace_at(4), { desc = "Put buffer in position 4" })

vim.keymap.set("n", "<leader>1", select(1), { desc = "Go to harpoon item 1" })
vim.keymap.set("n", "<leader>2", select(2), { desc = "Go to harpoon item 2" })
vim.keymap.set("n", "<leader>3", select(3), { desc = "Go to harpoon item 3" })
vim.keymap.set("n", "<leader>4", select(4), { desc = "Go to harpoon item 4" })
