return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  -- Syncs light/dark theme switching with system theme.
  "vimpostor/vim-lumen",
}
