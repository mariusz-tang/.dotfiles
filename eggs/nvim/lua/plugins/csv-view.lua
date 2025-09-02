vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Start CSV view plugin.",
  group = vim.api.nvim_create_augroup("enable-csvview", { clear = true }),
  pattern = "*.csv",
  callback = function()
    vim.api.nvim_command("CsvViewEnable")
  end,
})

return {
  "hat0uma/csvview.nvim",
  opts = {
    keymaps = {
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
    view = {
      display_mode = "border",
    },
  },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  keys = { { "<leader>vc", "<cmd>CsvViewToggle<cr>", desc = "Toggle CSV view" } },
}
