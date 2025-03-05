return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  config = true,
  lazy = false,
  branch = "regexp",
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "[V]env [S]Select" },
  },
}
