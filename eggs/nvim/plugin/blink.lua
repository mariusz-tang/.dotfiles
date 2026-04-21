vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", version = "v1" } })

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
    list = {
      selection = { preselect = false },
    },
    menu = {
      draw = { treesitter = { "lsp" } },
    },
  },
  cmdline = {
    keymap = { preset = "inherit" },
  },
  snippets = { preset = "mini_snippets" },
  signature = {
    enabled = true,
    window = { show_documentation = true },
  },
})
