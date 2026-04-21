require("vim._core.ui2").enable()

-- These can be overriden by exrc files.
MyLsps = {
  "bashls",
  "clangd",
  "cssls",
  "emmet_language_server",
  "html",
  "jsonls",
  "lua_ls",
  "pylsp",
  "taplo",
  "yamlls",
}
MyConformOpts = {
  -- Format-on-save is off by default.
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_organize_imports", "ruff_format" },
    zsh = { "beautysh" },
  },
}
MyLintersByFileType = {
  python = { "ruff" },
}
SetupDap = nil

-- Look for project-local settings.
vim.opt.exrc = true
