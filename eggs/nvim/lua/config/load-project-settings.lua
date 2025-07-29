local path_prefix = vim.env.HOME .. "/projects/"
local cwd = vim.uv.cwd() or path_prefix
local project_name = string.gsub(cwd, "^" .. path_prefix, "")

local data
-- Only attempt to load the settings if the current working directory
-- is an immediate ancestor of the projects directory.
if not string.match(project_name, "/") then
  local success, result = pcall(require, "projects." .. project_name)
  if success then
    data = result
  end
end

data = data or require("config.default-settings")
data.lsps = data.lsps or {}
data.linters = data.linters or {}
data.formatters = data.formatters or {}

local ensure_installed = {}

for lsp, _ in pairs(data.lsps) do
  table.insert(ensure_installed, lsp)
end

for _, formatters in pairs(data.formatters) do
  for _, formatter in ipairs(formatters) do
    table.insert(ensure_installed, formatter)
  end
end

for _, linters in pairs(data.linters) do
  for _, linter in ipairs(linters) do
    table.insert(ensure_installed, linter)
  end
end

data.ensure_installed = ensure_installed
ProjectSettings = data
