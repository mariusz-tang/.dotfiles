local severity = vim.diagnostic.severity
vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = "",
      [severity.WARN] = "",
      [severity.INFO] = "",
      [severity.HINT] = "",
    },
  },
  virtual_text = true,
})

vim.keymap.set("n", "<leader>vv", function()
  -- Force this to be a boolean for type-safety.
  local enabled = vim.diagnostic.config().virtual_lines == true
  vim.diagnostic.config({ virtual_lines = not enabled, virtual_text = enabled })
end, { desc = "Toggle diagnostic virtual lines" })
