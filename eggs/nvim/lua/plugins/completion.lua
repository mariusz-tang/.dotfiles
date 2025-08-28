return {
  {
    "nvim-mini/mini.completion",
    version = false,
    dependencies = { "nvim-mini/mini.icons", "nvim-mini/mini.snippets" },
    opts = {},
  },
  {
    "nvim-mini/mini.snippets",
    version = false,
    dependencies = "rafamadriz/friendly-snippets",
    opts = function()
      return { snippets = { require("mini.snippets").gen_loader.from_lang() } }
    end,
    config = function(_, opts)
      require("mini.snippets").setup(opts)
      MiniSnippets.start_lsp_server()
    end,
  },
}
