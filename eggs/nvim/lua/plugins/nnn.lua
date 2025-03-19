return {
  "luukvbaal/nnn.nvim",
  lazy = true,
  cmd = {
    "NnnExplorer",
    "NnnPicker",
  },
  keys = {
    { "<leader>np", "<cmd>NnnPicker %:p:h<cr>", desc = "[N]nn [P]icker" },
    { "<leader>ne", "<cmd>NnnExplorer %:p:h<cr>", desc = "[N]nn [E]xplorer" },
  },
  opts = {},
}
