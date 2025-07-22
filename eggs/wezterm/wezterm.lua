local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors
local colors = require("colors")
config.color_scheme = colors.scheme
config.window_background_opacity = colors.window_bg_opacity

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 32
config.use_fancy_tab_bar = false

local active_bg_col = colors.scheme_object.background
local active_fg_col = colors.scheme_object.foreground
local inactive_fg_col = colors.tab_bar_inactive_fg_color
local tab_bar_col = colors.tab_bar_bg_color

config.colors = {
	tab_bar = {
		background = tab_bar_col,
	},
}

local tab_bar_formatter = require("tab_bar_format")
wezterm.on("format-tab-title", tab_bar_formatter(tab_bar_col, inactive_fg_col, active_bg_col, active_fg_col))

-- Font
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12
config.line_height = 1.2
config.underline_thickness = 2
config.underline_position = -5
config.cursor_thickness = 1 -- This defaults to underline_thickness, which we have modifed.

-- General
config.enable_wayland = false

return config
