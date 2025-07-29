local colorscheme_repo = "ellisonleao/gruvbox.nvim"
local colorscheme_name = "gruvbox"

return {
  {
    colorscheme_repo,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme(colorscheme_name)
    end,
  },
  -- Syncs light/dark theme switching with system theme.
  "vimpostor/vim-lumen",
}
