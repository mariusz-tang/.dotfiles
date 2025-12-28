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
    python = { "isort", "black" },
    toml = { "taplo" },
    zsh = { "beautysh" },
  },
}
