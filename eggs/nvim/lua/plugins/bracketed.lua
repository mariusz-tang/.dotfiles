return {
  {
    "nvim-mini/mini.bracketed",
    version = false,
    opts = function()
      local remove_keymaps = { "file", "indent", "oldfile", "treesitter", "undo", "yank" }
      local opts = {}

      for _, keymap in ipairs(remove_keymaps) do
        opts[keymap] = { suffix = "" }
      end
      return opts
    end,
  },
}
