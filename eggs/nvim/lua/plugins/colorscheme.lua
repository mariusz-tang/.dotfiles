local colorscheme_repo = "ellisonleao/gruvbox.nvim"
local colorscheme_name = "gruvbox"

return {
  {
    lazy = false,
    priority = 1000,
    colorscheme_repo,
    init = function()
      vim.cmd.colorscheme(colorscheme_name)
    end,
  },
  "vimpostor/vim-lumen",
}
