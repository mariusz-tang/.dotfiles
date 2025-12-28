-- Used when editting my dotfiles.
return {
  lsps = {
    bashls = {},
    lua_ls = {},
    cssls = {},
  },
  formatters = {
    lua = { "stylua" },
    zsh = { "beautysh" },
    css = { "prettier" },
  },
}
