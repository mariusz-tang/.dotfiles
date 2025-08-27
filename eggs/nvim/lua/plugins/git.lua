return {
  {
    "echasnovski/mini-git",
    version = false,
    main = "mini.git",
    opts = {},
  },
  {
    "echasnovski/mini.diff",
    version = false,
    opts = {
      view = {
        style = "sign",
        signs = { add = "+", change = "~", delete = "X" },
      },
    },
    config = function(_, opts)
      require("mini.diff").setup(opts)
      vim.keymap.set("n", "<leader>vd", MiniDiff.toggle_overlay, { desc = "Toggle diff overlay" })
    end,
  },
}
