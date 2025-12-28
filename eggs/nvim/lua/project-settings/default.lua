-- Used if no other settings were found.
return {
  lsps = {
    bashls = {},
    lua_ls = {},
    qmlls = {},
  },
  formatters = {
    lua = { "stylua" },
    zsh = { "beautysh" },
  },
}
