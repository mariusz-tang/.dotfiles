local wezterm = require("wezterm")
local colors = {}

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local is_dark_appearance = get_appearance():find("Dark")

colors.scheme = is_dark_appearance and "GruvboxDark" or "GruvboxLight"
colors.scheme_object = wezterm.color.get_builtin_schemes()[colors.scheme]
colors.tab_bar_bg_color = is_dark_appearance and "#3c3836" or "ebdbb2"
colors.tab_bar_inactive_fg_color = is_dark_appearance and "#a89984" or "#7c6f64"
colors.window_bg_opacity = 0.5

return colors
