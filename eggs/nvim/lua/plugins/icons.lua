return {
  {
    "nvim-mini/mini.icons",
    version = false,
    lazy = true,
    config = function()
      require("mini.icons").setup()
      MiniIcons.tweak_lsp_kind()
    end,
  },
}
