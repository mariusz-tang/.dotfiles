MyConformOpts = {
  format_on_save = {
    lsp_format = "never",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    toml = { "taplo" },
    zsh = { "beautysh" },
  },
}

vim.opt.exrc = false
