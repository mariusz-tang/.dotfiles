return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = {
      "*",
      css = { parsers = { css = true } },
    },
    options = {
      parsers = {
        names = { enable = false },
      },
    },
  },
}
