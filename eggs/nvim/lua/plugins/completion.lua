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
    config = function()
      local snippets = require("mini.snippets")
      snippets.setup({
        snippets = {
          snippets.gen_loader.from_lang({
            -- C# files are recognized as c_sharp instead of csharp.
            lang_patterns = { c_sharp = { "/**/csharp/*.json" } },
          }),
        },
      })
      MiniSnippets.start_lsp_server()
    end,
  },
}
