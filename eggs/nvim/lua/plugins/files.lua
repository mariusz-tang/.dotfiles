return {
  {
    "nvim-mini/mini.files",
    version = false,
    dependencies = "nvim-mini/mini.icons",
    opts = {
      mappings = {
        -- Close file explorer on file enter by default.
        go_in = "L",
        go_in_plus = "l",
      },
      windows = {
        preview = true,
        width_preview = 50,
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)
      vim.keymap.set("n", "<leader>e", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end, { desc = "File explorer" })
      vim.keymap.set("n", "<leader>E", MiniFiles.open, { desc = "File explorer (current working directory)" })
    end,
  },
}
