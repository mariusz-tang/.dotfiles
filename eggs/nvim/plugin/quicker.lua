vim.pack.add({ "https://github.com/stevearc/quicker.nvim" })
local quicker = require("quicker")

local function expand()
  quicker.expand({ before = 2, after = 2, add_to_existing = true })
end

local function toggle_location_list()
  quicker.toggle({ loclist = true })
end

quicker.setup({
  keys = {
    { "<leader>x", expand, desc = "Expand quickfix context" },
    { "<leader>c", quicker.collapse, desc = "Collapse quickfix context" },
  },
})
vim.keymap.set("n", "<leader>q", quicker.toggle, { desc = "Toggle quickfix list" })
vim.keymap.set("n", "<leader>l", toggle_location_list, { desc = "Toggle location list" })
