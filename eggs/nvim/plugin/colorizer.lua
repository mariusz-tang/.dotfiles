vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })

vim.opt.termguicolors = true

require("colorizer").setup({
  filetypes = {
    "*",
    css = { parsers = { css = true } },
  },
  options = {
    parsers = {
      names = { enable = false },
    },
  },
})
