vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- DEPENDENCIES ---------------------------------------------------------------
require("mini.icons").setup()
require("mini.extra").setup()

-- MISCELLANEOUS --------------------------------------------------------------
require("mini.cursorword").setup()
require("mini.git").setup()
require("mini.jump").setup()
require("mini.move").setup()
require("mini.notify").setup()
require("mini.splitjoin").setup()
require("mini.statusline").setup()
require("mini.surround").setup({ n_lines = 40 })
require("mini.trailspace").setup()

-- AI -------------------------------------------------------------------------
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" })
local ai = require("mini.ai")

local ai_textobjects_map = {
  a = { outer = "@attribute.outer", inner = "@attribute.inner" },
  c = { outer = "@comment.outer", inner = "@comment.inner" },
  C = { outer = "@class.outer", inner = "@class.inner" },
  e = { outer = "@assignment.outer", inner = "@assignment.rhs" },
  E = { outer = "@assignment.outer", inner = "@assignment.lhs" },
  f = { outer = "@call.outer", inner = "@call.inner" },
  F = { outer = "@function.outer", inner = "@function.inner" },
  o = { outer = "@block.outer", inner = "@block.inner" },
  O = { outer = { "@conditional.outer", "@loop.outer" }, inner = { "@conditional.inner", "@loop.inner" } },
  p = { outer = "@parameter.outer", inner = "@parameter.inner" },
  r = { outer = "@return.outer", inner = "@return.inner" },
  s = { outer = "@statement.outer", inner = "@statement.outer" },
}
local ai_textobjects = {}
for i, textobject in pairs(ai_textobjects_map) do
  ai_textobjects[i] = ai.gen_spec.treesitter(
    { a = textobject.outer, i = textobject.inner },
    { use_nvim_treesitter = true }
  )
end

ai.setup({
  custom_textobjects = ai_textobjects,
  n_lines = 200,
})

-- BASIC ----------------------------------------------------------------------
require("mini.basics").setup({
  options = { extra_ui = true },
  mappings = { option_toggle_prefix = "" },
})
vim.keymap.del("n", "gO")
vim.keymap.del("n", "go")

-- CLUE -----------------------------------------------------------------------
local clue = require("mini.clue")
clue.setup({
  window = {
    delay = 200,
    config = { width = "auto" },
  },
  clues = {
    -- Custom keymap groups.
    { mode = "n", keys = "<Leader>d", desc = "+Debugger" },
    { mode = "n", keys = "<Leader>h", desc = "+Harpoon" },
    { mode = "n", keys = "<Leader>s", desc = "+Search" },
    -- Builtins.
    clue.gen_clues.square_brackets(),
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
  triggers = {
    -- Leader triggers
    { mode = { "n", "x" }, keys = "<Leader>" },
    -- `[` and `]` keys.
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    -- Built-in completion.
    { mode = "i", keys = "<C-x>" },
    -- `g` key.
    { mode = { "n", "x" }, keys = "g" },
    -- Marks.
    { mode = { "n", "x" }, keys = "'" },
    { mode = { "n", "x" }, keys = "`" },
    -- Registers.
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },
    -- Window commands.
    { mode = "n", keys = "<C-w>" },
    -- `z` key.
    { mode = { "n", "x" }, keys = "z" },
  },
})

-- DIFF -----------------------------------------------------------------------
require("mini.diff").setup({ view = { style = "number" } })
vim.keymap.set("n", "<leader>g", MiniDiff.toggle_overlay, { desc = "Toggle diff overlay" })

-- PAIRS ----------------------------------------------------------------------
require("mini.pairs").setup()

local map_bs = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
end

map_bs("<C-h>", "v:lua.MiniPairs.bs()")
map_bs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
map_bs("<C-u>", 'v:lua.MiniPairs.bs("\21")')

-- PICK -----------------------------------------------------------------------
require("mini.pick").setup({
  options = { content_from_bottom = true },
})

local function pick_all_files()
  MiniPick.builtin.cli({ command = { "rg", "--files", "-uuu", "--no-config" } })
end

local function pick_help()
  MiniPick.builtin.help({ default_split = "vertical" })
end

vim.keymap.set("n", "<leader>sF", pick_all_files, { desc = "All files" })
vim.keymap.set("n", "<leader>sf", MiniPick.builtin.files, { desc = "Files" })
vim.keymap.set("n", "<leader>sg", MiniPick.builtin.grep_live, { desc = "Live grep" })
vim.keymap.set("n", "<leader>sG", MiniPick.builtin.grep, { desc = "Static grep" })
vim.keymap.set("n", "<leader>sh", pick_help, { desc = "Help" })
vim.keymap.set("n", "<leader>sm", MiniExtra.pickers.manpages, { desc = "Manual pages" })

-- SNIPPETS -------------------------------------------------------------------
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })
require("mini.snippets").setup({
  snippets = {
    require("mini.snippets").gen_loader.from_lang({
      -- C# files are recognized as c_sharp instead of csharp.
      lang_patterns = { c_sharp = { "/**/csharp/*.json" } },
    }),
  },
})
