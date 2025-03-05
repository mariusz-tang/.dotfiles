local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/sbin/fd"
local workspace_dir = os.getenv("HOME") .. "/.config/wezterm/workspaces"

M.toggle = function(window, pane)
	local workspaces = {}

	local success, stdout, stderr = wezterm.run_child_process({
		fd,
		"-HI",
		".lua$",
		"--max-depth=2",
		"--prune",
		workspace_dir,
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local path = line
		local label = path:gsub(".lua$", "")
		label = label:gsub("^" .. workspace_dir .. "/", "")
		local id = label:gsub(".*/", "")
		table.insert(workspaces, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					local script = require("workspaces." .. label)
					local exists = false
					for _, workspace in pairs(wezterm.mux.get_workspace_names() or {}) do
						if workspace == id then
							exists = true
							break
						end
					end
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = script.spawn }), pane)
					if (not exists) and script.setup then
						script.setup(win, pane)
					end
				end
			end),
			fuzzy = true,
			title = "Select workspace",
			choices = workspaces,
		}),
		pane
	)
end

return M
