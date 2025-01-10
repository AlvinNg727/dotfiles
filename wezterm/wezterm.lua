local wezterm = require("wezterm")
local one_dark = require("theme")

local config = wezterm.config_builder()

config.animation_fps = 60

config.enable_wayland = true

config.color_schemes = {
	["one_dark"] = one_dark,
}
config.color_scheme = "one_dark"

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 11

config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = "200%"
config.force_reverse_video_cursor = true

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.window_background_opacity = 0.8

config.window_frame = {
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
}

config.window_padding = {
	left = "3pt",
	right = "3pt",
	top = "3pt",
	bottom = "3pt",
}

config.launch_menu = {
	{
		label = "btop",
		args = { "btop" },
	},
	{
		label = "Bash",
		args = { "bash", "-l" },
	},
}

config.default_prog = { "/usr/bin/fish", "-l" }

return config
