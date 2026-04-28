vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
require("render-markdown").setup({
  render_modes = true,
  anti_conceal = {
    disabled_modes = { "n" },
  },
})
