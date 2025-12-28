-- Load the correct project settings module.
local settings_module = "project-settings.default"
local notification_text = "Loaded default project settings!"
local cwd = vim.uv.cwd() or ""
local in_dotfile_directory = string.match(cwd, "^" .. vim.env.HOME .. "/.config/yolk")
if in_dotfile_directory then
  settings_module = "project-settings.dotfiles"
  notification_text = "Loaded dotfiles project settings!"
else
  local has_project_map, project_map = pcall(require, "project-settings.map")
  if has_project_map and project_map[cwd] then
    settings_module = project_map[cwd]
    notification_text = "Loaded custom project settings!"
  end
end
local settings = require(settings_module)
settings.notification_text = notification_text

-- Insert missing tables.
settings.lsps = settings.lsps or {}
settings.linters = settings.linters or {}
settings.formatters = settings.formatters or {}
settings.dap_handlers = settings.dap_handlers or {}

-- Generate list of tools for mason-tool-installer to install.
local tools = {}
settings.ensure_installed = tools

for lsp, _ in pairs(settings.lsps) do
  table.insert(tools, lsp)
end

for _, formatters in pairs(settings.formatters) do
  for _, formatter in ipairs(formatters) do
    table.insert(tools, formatter)
  end
end

for _, linters in pairs(settings.linters) do
  for _, linter in ipairs(linters) do
    table.insert(tools, linter)
  end
end

-- Generate list of tools for mason-nvim-dap to install.
local daps = {}
settings.ensure_installed_daps = daps

for handler, _ in pairs(settings.dap_handlers) do
  table.insert(daps, handler)
end

-- Expose settings globally.
ProjectSettings = settings
