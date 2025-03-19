return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- Floating window border decoration.
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "[L]azy[G]it" },
    { "<leader>ch", "<cmd>LazyGitFilter<cr>", desc = "[C]ommit [H]istory" },
    { "<leader>fh", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "[F]ile [H]istory" },
  },
}
