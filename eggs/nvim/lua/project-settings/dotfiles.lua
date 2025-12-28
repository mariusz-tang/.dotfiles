-- Used when editting my dotfiles.
return {
  lsps = {
    bashls = {},
    cssls = {},
    lua_ls = {},
  },
  formatters = {
    css = { "prettier" },
    lua = { "stylua" },
    toml = { "taplo" },
    zsh = { "beautysh" },
  },
}
