return {
  {
    "nvim-mini/mini.basics",
    version = false,
    -- High priority so other plugin specs can override keybinds.
    priority = 900,
    opts = {
      options = { extra_ui = true },
      mappings = { option_toggle_prefix = "", move_with_alt = true },
      autocommands = { basic = false },
    },
    config = function(_, opts)
      require("mini.basics").setup(opts)
      vim.keymap.del("n", "go")
      vim.keymap.del("n", "gO")
    end,
  },
}
