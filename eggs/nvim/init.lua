require("vim._core.ui2").enable()

-- These can be overriden by exrc files.
MyLsps = {
  "bashls",
  "clangd",
  "cssls",
  "emmet_language_server",
  "gh_actions_ls",
  "html",
  "jsonls",
  "lua_ls",
  "pylsp",
  "tombi",
  "yamlls",
}
MyConformOpts = {
  -- Format-on-save is off by default.
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    zsh = { "beautysh" },
  },
}
MyLintersByFileType = {}
SetupDap = nil

-- Look for project-local settings.
vim.opt.exrc = true
