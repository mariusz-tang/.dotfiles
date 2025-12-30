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
        local buffer_name = vim.api.nvim_buf_get_name(0)
        -- This will fail if the current buffer does not represent a file.
        local succeeded = pcall(MiniFiles.open, buffer_name)
        if not succeeded then
          -- Open the current working directory instead.
          MiniFiles.open()
        end
      end, { desc = "File explorer" })
    end,
  },
}
