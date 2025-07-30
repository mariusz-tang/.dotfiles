return {
  {
    "echasnovski/mini.completion",
    version = false,
    dependencies = { "echasnovski/mini.icons", "echasnovski/mini.snippets" },
    opts = {},
  },
  {
    "echasnovski/mini.snippets",
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
