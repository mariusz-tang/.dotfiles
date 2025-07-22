-- Project-level settings.

local default = {}
default.lsps = {}
default.lsps.lua_ls = {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = { disable = { "missing-fields" } },
    },
  },
}
default.lsps.pylsp = {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 88,
          extend_ignore = { "E203", "E701" },
        },
      },
    },
  },
}
default.lsps.taplo = {}
default.lsps.emmet_language_server = {
  settings = {
    filetypes = { "css", "html", "javascript", "djangohtml" },
  },
}

default.linters = {
  markdown = { "markdownlint" },
}

default.formatters = {
  lua = { "stylua" },
  -- We ignore any conflicts by always running black AFTER isort.
  python = { "isort", "black" },
}

default.mason_required_tools = { "stylua", "isort", "black", "markdownlint" }

local success, result = pcall(require, "config.project-overrides")
-- Using vim.g.project_settings from the start has weird behaviour which
-- prevents modification of the mason_required_tools property. I'm not sure why
-- this is yet.
local proj_settings = success and result or {}

if proj_settings.extra_setup then
  proj_settings.extra_setup()
  proj_settings.extra_setup = nil
end

-- Provide missing values.
for _, property in ipairs(vim.tbl_keys(default)) do
  proj_settings[property] = vim.tbl_extend("keep", proj_settings[property] or {}, default[property])
end

proj_settings.mason_required_tools =
  vim.list_extend(proj_settings.mason_required_tools, vim.tbl_keys(proj_settings.lsps))

vim.g.project_settings = proj_settings
