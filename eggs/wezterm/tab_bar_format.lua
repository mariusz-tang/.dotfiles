local wezterm = require("wezterm")

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

local function tab_title_formatter(tab_bar_bg_color, inactive_tab_fg_color, active_tab_bg_color, active_tab_fg_color)
	local function render_tab_title(title, fg_color, bg_color)
		return {
			{ Foreground = { Color = fg_color } },
			{ Background = { Color = bg_color } },
			{ Text = title },
		}
	end

	local function formatted_tab_title(tab, _, _, _, hover, max_width)
		local reserved_space = 4
		local title = string.sub(tab_title(tab), 1, max_width - reserved_space)
		local spacer = "  "
		title = spacer .. title .. spacer
		local fg_color = tab.is_active and active_tab_fg_color or inactive_tab_fg_color
		local bg_color = tab.is_active and active_tab_bg_color or tab_bar_bg_color
		return render_tab_title(title, fg_color, bg_color)
	end

	return formatted_tab_title
end

return tab_title_formatter
