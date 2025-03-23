local wezterm = require("wezterm")
local act = wezterm.action
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local one_dark = require("theme")

local config = wezterm.config_builder()

-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "LowPower"
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Gl" and gpu.device_type == "IntegratedGpu" then
		config.webgpu_preferred_adapter = gpu
		config.front_end = "WebGpu"
		break
	end
end

config.enable_wayland = true

-- FPS
config.animation_fps = 60
config.max_fps = 60

-- theming
config.color_schemes = {
	["one_dark"] = one_dark,
}
config.color_scheme = "one_dark"

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 11

config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = "200%"
config.force_reverse_video_cursor = true

-- tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false

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
		label = "Fish",
		args = { "fish", "-l" },
	},
	{
		label = "Bash",
		args = { "bash", "-l" },
	},
	{
		label = "Btop",
		args = { "btop" },
	},
}

config.default_prog = { "/usr/bin/fish", "-l" }

config.keys = {
	-- misc
	{ key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	{ key = "n", mods = "CTRL|SHIFT", action = act.ShowLauncher },
	{ key = "F12", action = act.ShowDebugOverlay },

	-- copy/paste
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

	-- tabs
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("DefaultDomain") },
	{ key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },

	-- pane
	{ key = '"', mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "%", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "Enter", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
	{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timeout_miliseconds = 1000,
		}),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
}

smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },

	modifiers = {
		move = "CTRL|SHIFT",
	},
})

return config
