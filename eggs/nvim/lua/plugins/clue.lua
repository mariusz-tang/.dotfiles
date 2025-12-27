return {
  {
    "nvim-mini/mini.clue",
    version = false,
    opts = function()
      local gen_clues = require("mini.clue").gen_clues
      return {
        clues = {
          { mode = "n", keys = "<Leader>b", desc = "+Black hole" },
          { mode = "n", keys = "<Leader>t", desc = "+Treesitter" },
          { mode = "n", keys = "<Leader>s", desc = "+Search" },
          { mode = "n", keys = "<Leader>l", desc = "+LSP" },
          { mode = "n", keys = "<Leader>v", desc = "+View" },
          gen_clues.builtin_completion(),
          gen_clues.g(),
          gen_clues.marks(),
          gen_clues.registers(),
          gen_clues.windows(),
          gen_clues.z(),
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          -- Built-in completion
          { mode = "i", keys = "<C-x>" },
          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },
          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },
          -- Window commands
          { mode = "n", keys = "<C-w>" },
          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
          -- Brackets
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
        },
        window = {
          delay = 200,
          config = { width = "auto" },
        },
      }
    end,
  },
}
